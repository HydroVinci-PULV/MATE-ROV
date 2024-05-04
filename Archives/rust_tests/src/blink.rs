use std::error::Error;
use std::thread;
use std::time::Duration;

use rppal::gpio::{Gpio, OutputPin};// for the pin
use rppal::system::DeviceInfo;

// Gpio uses BCM pin numbering. BCM GPIO 23 is tied to physical pin 16.
const GPIO_LED: u8 = 23;

fn main() -> Result<(), Box<dyn Error>> {
    println!("Blinking an LED on a {}.", DeviceInfo::new()?.model());

    let mut pin: OutputPin = Gpio::new()?.get(GPIO_LED)?.into_output();
    //establish that the pin GPIO_LED in the GPIO table is an output

    // Blink the LED by setting the pin's logic level high for 500 ms.
    pin.set_high();

    thread::sleep(Duration::from_millis(500));//sleep for 500 millisec
    pin.set_low();

    Ok(())  
}