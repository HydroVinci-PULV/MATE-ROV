use std::error::Error;
use std::thread;
use tokio::sync::mpsc;
use tokio::stream::StreamExt;
use evdev::{Device,EventType};
use rppal::pwm::{Channel, Polarity, Pwm};

const FREQUENCY_HZ: u64 = 1000;

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    let (tx, rx) = mpsc::channel(10);

    let pwm0 = Pwm::with_frequency(
        Channel::Pwm0,
        FREQUENCY_HZ as f64,
        0.0, // 50% duty cycle
        Polarity::Normal,
        true,
    )?;
    let pwm1=Pwm::with_frequency(
        Channel::Pwm1,
        FREQUENCY_HZ as f64,
        0.0, // 0% duty cycle
        Polarity::Normal,
        true,
    )?;

    let device = Device::open("/dev/input/event0")?;
    device.into_event_stream()?.for_each(|event| {
        if event.event_type == EventType::KEY {
            if event.value == 1 {
                tx.send(event).unwrap();
            }
        }
    }).await;

    while let Some(event) = rx.recv().await {
        if event.code.key().unwrap() == Key::KEY_UP {
            pwm0.set_polarity(Polarity::Normal)?;
            pwm0.set_duty_cycle(0.75)?;
        } else if event.code.key().unwrap() == Key::KEY_DOWN {
            pwm0.set_polarity(Polarity::Inverse)?;
            pwm0.set_duty_cycle(0.75)?;
        } else if event.code.key().unwrap() == Key::KEY_LEFT {
            pwm1.set_polarity(Polarity::Normal)?;
            pwm1.set_duty_cycle(0.75)?;
        } else if event.code.key().unwrap() == Key::KEY_RIGHT {
            pwm1.set_polarity(Polarity::Inverse)?;
            pwm1.set_duty_cycle(0.75)?;
        }
    }

    Ok(())
}
