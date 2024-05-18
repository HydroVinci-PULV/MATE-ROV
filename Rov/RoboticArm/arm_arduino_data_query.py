import serial
import time
import socket
import struct
import sys


with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect(('169.254.245.11', 12345))
        print("connected")
        arduino=serial.Serial(port='COM3',baudrate=9600, timeout=1)
        print("arduino connected")
        try:
            arduino.write(b"aaaaa")
            print("query sent")
            data = bytearray()
            pwm=arduino.read(100)
            print(len(pwm))
            val = 0.0
            power = 0
            for i in pwm:
                # print(i)
                if (i == 59):
                    print(";")
                    data.extend(struct.pack('f',val))
                    val = 0.0
                    power = 0
                elif (chr(i).isnumeric()) :
                    val+=float(chr(i)) * pow(10, power)
                    power += 1
                    print(val)
            s.sendall(data)
            print("data sent")
        
        except Exception as e:
                print(f"Error sending data: {e}")
sys.exit()