use mpu6050::*;
use rppal::i2c::I2c;//{I2c,Error};
use rppal::hal::Delay;
//use std::thread;
//use std::time::Duration;
//use std::error::Error as OthError;
use rppal::pwm::{Channel, Polarity, Pwm};
//use anyhow::Result;
const FREQUENCY_HZ: u64 = 1000;



    // Test gyro config
 /* println!("Test gyro config");
    assert_eq!(mpu.get_gyro_range()?, GyroRange::D250);
    mpu.set_gyro_range(GyroRange::D500)?;
    assert_eq!(mpu.get_gyro_range()?, GyroRange::D500);

// In a module or your main file
fn convert_to_anyhow(err: Mpu6050Error<rppal::i2c::Error>) -> anyhow::Error {
    anyhow::Error::msg(err.to_string())
}
*/
#[derive(Debug)]
pub struct MyMpu6050Error(Mpu6050Error<rppal::i2c::Error>);
impl From<Mpu6050Error<rppal::i2c::Error>> for MyMpu6050Error {
    fn from(err: Mpu6050Error<rppal::i2c::Error>) -> MyMpu6050Error {
        MyMpu6050Error(err)
    }
}
impl std::fmt::Display for MyMpu6050Error {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "MPU6050 Error")
    }
}

impl std::error::Error for MyMpu6050Error {}


fn main() -> Result<(),anyhow::Error>{//}, Box<dyn Error>>{
    let i2c=I2c::new().map_err(anyhow::Error::new)?;//.map_err(Mpu6050Error::I2c)?;     //.map_err(anyhow::Error::new)?;//|e| Mpu6050Error::I2c(e))?;
    let mut mpu=Mpu6050::new(i2c);
    let mut delay=Delay;
    mpu.init(&mut delay).map_err(MyMpu6050Error::from)?;    //.map_err(convert_to_anyhow)?;
    let pwm0 = Pwm::with_frequency(
        Channel::Pwm0,
        FREQUENCY_HZ as f64,
        0.0, // 0% duty cycle
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
    
    loop{
        let gyro=mpu.get_gyro();
        




    }
    //Ok(())
}


