use mpu6050::*;
use rppal::i2c::{I2c,Error};
use rppal::hal::Delay;
use std::thread;
use std::time::Duration;


fn main() -> Result<(), Mpu6050Error<Error>> {
    let i2c=I2c::new().map_err(Mpu6050Error::I2c)?;
    let mut mpu=Mpu6050::new(i2c);
    thread::sleep(Duration::from_secs(1));
    let mut delay=Delay;
    mpu.init(&mut delay)?;
    loop{
        // get roll and pitch estimate
    let acc = mpu.get_acc_angles()?;
    println!("r/p: {:?}", acc);

    // get temp
    let temp = mpu.get_temp()?;
    println!("temp: {:?}c", temp);

    // get gyro data, scaled with sensitivity 
    let gyro = mpu.get_gyro()?;
    println!("gyro: {:?}", gyro);

    // get accelerometer data, scaled with sensitivity
    let acc = mpu.get_acc()?;
    println!("acc: {:?}", acc);

    }

}