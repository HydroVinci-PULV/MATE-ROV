use std::error::Error;
use std::thread;
use std::time::Duration;

use rppal::pwm::{Channel, Polarity, Pwm};

// DC Motor configuration.
// Frequency: 1 kHz (1000 Hz).
const FREQUENCY_HZ: u64 = 1000;

fn main() -> Result<(), Box<dyn Error>> {
    // Enable PWM channel (e.g., Channel::Pwm0 for BCM GPIO 18) with the specified frequency.
    let pwm = Pwm::with_frequency(
        Channel::Pwm0,
        FREQUENCY_HZ as f64,
        0.5, // 50% duty cycle
        Polarity::Normal,
        true,
    )?;

    // Sleep for a duration to observe the motor speed.
    thread::sleep(Duration::from_secs(3));

    // Change the speed of the motor by adjusting the duty cycle.
    // For example, setting to 75% to increase speed.
    pwm.set_duty_cycle(0.75)?;

    thread::sleep(Duration::from_secs(5));

    Ok(())
}
