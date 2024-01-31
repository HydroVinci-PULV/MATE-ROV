use std::error::Error;
use std::thread;
use std::time::Duration;
use std::io;
use std::fs::File;
use rppal::pwm::{Channel, Polarity, Pwm};
use buttons::Buttons;
use std::collectiohns::HashSet;
use evdev::{Device,Key,EventType};
//#[cfg(feature="winit")]
//use winit::{event::*, event_loop::{ControlFlow,EventLoop}};
//#[cfg(feature="winit")]

const FREQUENCY_HZ: u64 = 1000;

fn main() -> Result<(), Box<dyn Error>>{
   // let event_loop=winit::event_loop::EventLoop::new();

   // let mut keyboard=buttons::winit::keyboard();
    let file =File::open("dev/input/event0")?;
    let mut device=Device::new().unwrap();
    device.set_file(file);


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

    //let mut btns=Buttons::new()
    //let mut pressed_keys=HashSet::new();
    /* 
    loop{
        btns.update();
        if btns.is_pressed('z'){
            pwm0.set_polarity(Inverse)?;
            pwm0.set_duty_cycle(0.75)?;
        }
        elif btns.is_pressed('s'){
            pwm0.set_duty_cycle(0.75);
            
        }
        else{pwm0.set_duty_cycle(0.0);}

        if btns.is-pressed('q')
        {pwm1.set_duty_cycle(0.75)
        }
        else{pwm1.set_duty_cycle(0.0);}
    event_loop.run( move |event,_,_|{
        keyboard.handle_event(&event);
        if keyboard.pressed(VirtualKeyCode::Up){

        }




    })*/

    loop{
        for ev in device.fetch_events()?{
            if ev.is_key(){
                match ev.value{
                    1=>{
                        if let Some(key)=ev.code.key(){
                            println!("key pressed: {:?}", key);
                            match key{
                            Key::KEY_UP{
                                pwm0.set_polarity(Normal)?;
                                pwm0.set_duty_cycle(0.75)?;
                            }
                            Key::KEY_DOWN{}
                            Key::KEY_LEFT{}
                            Key::KEY_RIGHT{}

                        }
                        }
                    }
                    0=>{

                    }
                }
            }
        }
    }




    }



}