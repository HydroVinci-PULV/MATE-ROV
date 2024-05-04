use rppal::gpio::Gpio;
use tokio::io::AsyncReadExt;
use tokio::net::TcpListener;
use std::sync::{Arc, Mutex};

const LED_PIN1: u8 = 17;
const LED_PIN2: u8 = 23;

#[tokio::main]
async fn main() -> tokio::io::Result<()> {

    let mut led1 = Gpio::new().expect("Failed to initialize GPIO").get(LED_PIN1).expect("Failed to get LED pin1").into_output();
    let mut led2 = Gpio::new().expect("Failed to initialize GPIO").get(LED_PIN2).expect("Failed to get LED pin2").into_output();
    led2.set_low();
    led1.set_low();
    let led1 = Arc::new(Mutex::new(led1));
    let led2 = Arc::new(Mutex::new(led2));
    let listener = TcpListener::bind("0.0.0.0:12345").await?;

    loop {
        let (mut socket, _) = listener.accept().await?;
        let led1_clone=Arc::clone(&led1);
        let led2_clone=Arc::clone(&led2);
        tokio::spawn(async move {
            let mut buf = [0; 1024];
            
            loop {
                let n = match socket.read(&mut buf).await {
                    Ok(n) if n == 0 => return,
                    Ok(n) => n,
                    Err(e) => {
                        eprintln!("failed to read from socket; err = {:?}", e);
                        return;
                    }
                };

                if let Ok(text) = std::str::from_utf8(&buf[0..n]) {
                    println!("Received data: {}", text);
                    let mut led1=led1_clone.lock().unwrap();
                    let mut led2=led2_clone.lock().unwrap();
                    match text.trim().parse::<f32>() {
                        Ok(value) if value > 0.0 => {
                            println!("value: {:?}",value);
                            led1.set_high();
                            led2.set_low();
                        },
                        Ok(value) if value<0.0 => {
                            println!("vallue: {:?}",value);
                            led2.set_low();
                            led1.set_low();
                        },
                        Ok(_)=>{
                            led1.set_low();
                            led2.set_low();
                        },
                        Err(_) => eprintln!("Received data is not a valid number"),
                    }
                } else {
                    eprintln!("Received data could not be decoded as UTF-8");
                }

                // Optionally, echo the data back to the sender or handle accordingly
                /*if let Err(e) = socket.write_all(&buf[0..n]).await {
                    eprintln!("failed to write to socket; err = {:?}", e);
                    return;
                }*/
            }
        });
    }
}
