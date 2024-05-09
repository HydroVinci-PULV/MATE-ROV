
use tokio::net::TcpListener;
use tokio::io::AsyncReadExt;
use time;
//use std::thread::spawn;
use linux_embedded_hal::Delay;//, I2cdev};
//use mpu6050::*;
//use std::f32::consts::PI;
//use pwm_pca9685::{Channel, Pca9685, Address};
use rppal::pwm::{Channel,Polarity,Pwm};
use std::error::Error;
use std::thread;
use std::time::Duration;

/*
#[derive(Serialize, Deserialize,Debug)]
struct DataPackage {
    motors: Vec<f32>,
}
 */
const PERIOD_MS:u64=20;
const PULSE_MIN:u64=1000;
const PULSE_MAX:u64=2000;
const PULSE_NEUTR:u64=1500;



#[tokio::main]
async fn main() -> Result<(),Box<dyn Error>> {
        let listener = TcpListener::bind("0.0.0.0:12345").await?;
/*
        let i2c_mpu = I2cdev::new("/dev/i2c-1")
        .map_err(|e| format!("Failed to open I2C device: {:?}", e))?;

        let i2c_pca = I2cdev::new("/dev/i2c-2")
        .map_err(|e| format!("Failed to open I2C device: {:?}", e))?;
*/
        let mut delay = Delay;

    // Attempt to initialize MPU6050
        //let mpu_address = 0x68; // default I2C address for MPU6050
        /*let mut mpu = Mpu6050::new(i2c_mpu);
        mpu.init(&mut delay).expect("erreure d'initialisation du mpu");
        */
//Si il y a des erreures dans la répartitions des I2C, vérifies les avec i2cdetect
    // Attempt to initialize PCA9685
        /*let pca_address = Address::default(); // default I2C address for PCA9685
        let mut pwm = Pca9685::new(i2c_pca, pca_address).unwrap();

        pwm.set_prescale(100).unwrap(); // Set frequency of PWM outputs to 60Hz
        pwm.enable().unwrap();
        */
        let (mut socket, _) = listener.accept().await?;


        /*let pwm=Pwm::with_period(Channel::Pwm0,
            Duration::from_millis(PERIOD_MS),
             Duration::from_micros(PULSE_NEUTR),
              Polarity::Normal, true)?;*/



            tokio::spawn(async move {
             //   let port_name = "/dev/ttyUSB0"; // Adjust this according to your system
             //   let baud_rate = 9600;
                //let mut port = serialport::new(port_name,baud_rate)
                //.timeout(Duration::from_millis(10)).open().expect("failed to open port");
            let mut buf = [0u8; 16];
            //let mut buf = vec![0; 1024];
            //let mut h1;
            //let mut h2;
            //let mut H3;
            //let mut v1;
            //let mut v2;
            //let mut v3;
            //let mut throttle;
            /*let mut accel;
            let mut gyro;
            let mut angle_roll;
            let mut angle_pitch;
            let mut theta;
            let mut cons;
            let mut norm;*/
        //    let mut roll=0.0;
        //    let mut pitch=0.0;
        //    let mut val;

        //    thread::sleep(Duration::from_millis(7000));
            loop{
        //        let mut data_points = Vec::new();

                //lis les donnés de la station{
               
                match socket.read_exact(&mut buf).await{

                Ok(_) => {
                    let data_points = [
                    f32::from_le_bytes(buf[0..4].try_into().unwrap()),
                    f32::from_le_bytes(buf[4..8].try_into().unwrap()),
                    f32::from_le_bytes(buf[8..12].try_into().unwrap()),
                    f32::from_le_bytes(buf[12..16].try_into().unwrap()),
                    //f32::from_le_bytes(buf[16..20].try_into().unwrap()),
                ];
                println!("Received data points: {:?}", data_points);

                },
                Err(e) => {
                println!("Failed to read from socket or incomplete data received; error = {:?}", e);
                time::sleep(Duration::from_millis(10)).await; // Small delay to prevent a busy loop
                continue;
                }
            }
            
            //}
            //récupères les donnés du MPU:


            /*accel = mpu.accel_norm(&mut delay)?;
            gyro = mpu.gyro_norm(&mut delay)?;

            let angle_roll = (accel.y.atan2((accel.x.powi(2) + accel.z.powi(2)).sqrt()) * 180.0 / PI) as f32;
            let angle_pitch = (-accel.x.atan2((accel.y.powi(2) + accel.z.powi(2)).sqrt()) * 180.0 / PI) as f32;
            */



            // !!!!!Ces angles ne sont ni recalibrés par un PID ni traités par un kalman!!!!!
            /*
            match mpu.get_acc_angles(){
                Ok(angles)=>{
                    roll=angles.x*180./PI;
                    pitch=angles.y*180./PI;
                },
                Err(e)=>{
                    println!("issue with acceleration angles {:?}",e);
                }
            }*/

         //calcul la puissance délivrée au moteurs{
            /*theta=data_points[2].atan2(data_points[1]);
            norm=(data_points[1].powi(2)+data_points[2].powi(2)).sqrt();
            cons=(1.0-theta.sin())/(theta.cos()+1e-6);
            throttle=((data_points[0]+1.0)/2.0)*255.0;
            //on met une constante pour éviter les problèmes quand cos(theta)=0
            //ici on définit la puissance des moteurs
            //soit O l'angle entre x et la direction pointée, la puissance des moteurs sera 0.5(+-)0.5*cos(O)
            h1=(1.0+cons)*0.5*norm*4096.0;
            h2=(1.0-cons)*0.5*norm*4096.0;
            v1=1.024*(throttle-roll-pitch)*4096.0/255.0;
            v2=1.024*(throttle+roll-pitch)*4096.0/255.0;
            v3=1.024*(throttle+2.0*pitch)*4096.0/255.0;*/
            //}
         //   val=1500.0+data_points[2]*500.0;
        //    let _=pwm.set_pulse_width(Duration::from_micros(val as u64));
        //thread::sleep(Duration::from_millis(10));

            //envoie des valeures au pca9685 !!!!remplacer les valeures des channels (C0, C1, C2, etc...) par les valeures où sont branchés les moteurs
            /*pwm.set_channel_on_off(Channel::C0, 0,h1.round() as u16).unwrap();
            pwm.set_channel_on_off(Channel::C1, 0,h2.round() as u16).unwrap();
            pwm.set_channel_on_off(Channel::C3, 0,v1.round() as u16).unwrap();
            pwm.set_channel_on_off(Channel::C4, 0,v2.round() as u16).unwrap();
            pwm.set_channel_on_off(Channel::C5, 0,v3.round() as u16).unwrap();*/


        }

        });
        Ok(())
    }
