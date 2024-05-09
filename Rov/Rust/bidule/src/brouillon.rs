use tokio::time;
use tokio::net::TcpListener;
use tokio::io::AsyncReadExt;
//use std::thread::spawn;
use linux_embedded_hal::{Delay,I2cdev};
//use mpu6050::*;
//use std::f32::consts::PI;
use pwm_pca9685::{Channel, Pca9685, Address};
//use rppal::pwm::{Channel,Polarity,Pwm};
use std::error::Error;
use std::thread;
use std::time::Duration;


//const PERIOD_MS:u64=20;
//const PULSE_MIN:u64=1000;
//const PULSE_MAX:u64=2000;
//const PULSE_NEUTR:u64=1500;



#[tokio::main]
async fn main() -> Result<(),Box<dyn Error>> {
        let listener = TcpListener::bind("0.0.0.0:12345").await?;
        println!("connected");

        let i2c_pca = I2cdev::new("/dev/i2c-1")
        .map_err(|e| format!("Failed to open I2C device: {:?}", e))?;
        //let mut delay = Delay;

    // Attempt to initialize PCA9685
        let pca_address = Address::default(); // default I2C address for PCA9685
        let mut pca= Pca9685::new(i2c_pca, pca_address).unwrap();
        //pca.init(&mut delay);

        pca.set_prescale(127).unwrap(); // Set frequency of PWM outputs to 60Hz

        pca.enable().unwrap();
        pca.set_channel_on_off(Channel::C2,0, 307).unwrap();
        pca.set_channel_on_off(Channel::C1,0, 307).unwrap();
        pca.set_channel_on_off(Channel::C0,0, 307).unwrap();
        thread::sleep(Duration::from_millis(7000));



        while let Ok((mut socket, addr))=listener.accept().await{
            println!("connection from {}",addr);

            /*let pwm=Pwm::with_period(Channel::Pwm0,
                Duration::from_millis(PERIOD_MS),
                 Duration::from_micros(PULSE_NEUTR),
                  Polarity::Normal, true)?;*/

            let mut buf=[0u8;16];


            while let Ok(_)=socket.read_exact(&mut buf).await{
                let data_points=[
                f32::from_le_bytes(buf[0..4].try_into().unwrap()),
                f32::from_le_bytes(buf[4..8].try_into().unwrap()),
                f32::from_le_bytes(buf[8..12].try_into().unwrap()),
                f32::from_le_bytes(buf[12..16].try_into().unwrap())
                ];
                println!("received data: {:?}", data_points);
                /*
                let theta=data_points[2].atan2(data_points[1]);
                let norm=(data_points[1].powi(2)+data_points[2].powi(2)).sqrt();
                let cons=(1.0-theta.sin())/(theta.cos()+1e-6);
                let throttle=((data_points[0]+1.0)/2.0)*255.0;

                let h1=(1.0+cons)*0.5*norm*4096.0;
                let h2=(1.0-cons)*0.5*norm*4096.0;*/
                let h1=307.0-data_points[1]*82.0;
                let h2=307.0+data_points[0]*82.0;
                let h3=307.0+data_points[2]*82.0;

                pca.set_channel_on_off(Channel::C0, 0,h1.round() as u16).unwrap();
                pca.set_channel_on_off(Channel::C1, 0,h2.round() as u16).unwrap();
                pca.set_channel_on_off(Channel::C2, 0,h3.round() as u16).unwrap();

                thread::sleep(Duration::from_millis(100));

            }
        }
        Ok(())
    }