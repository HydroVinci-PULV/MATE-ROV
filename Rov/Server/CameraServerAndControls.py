import io
import logging
import socketserver
from http import server
from threading import Condition
import threading
import os
import time

from picamera2 import Picamera2
from picamera2.encoders import JpegEncoder
from picamera2.outputs import FileOutput

# HTML page for the MJPEG streaming demo
PAGE_STREAM = """\
<html>
<head>
<title>La rasp de la vie en rust</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #003300; /* Fond vert foncé */
        margin: 0;
        display: flex;
        flex-direction: row;
        height: 100vh;
    }
    h1 {
        color: #FFFFFF; /* Blanc */
        margin-bottom: 10px;
        text-align: center;
        font-family: 'Pacifico', cursive; /* Police originale */
        text-transform: uppercase;
        text-shadow: 3px 3px 3px rgba(0,0,0,0.5); /* Ombre légère */
        position: relative;
    }
    h1::after {
        content: attr(data-text); /* Utilise le contenu de l'attribut data-text */
        position: absolute;
        top: 2px; /* Légère décalage vers le haut */
        left: 0;
        color: rgba(255,255,255,0.2); /* Couleur de l'ombre avec opacité */
        z-index: -1; /* Place l'ombre derrière le texte */
    }
    .container {
        display: flex;
        width: 100%;
        height: 100%;
    }
    .video-container {
        flex: 1;
        margin-right: 20px;
        position: relative;
    }
    img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border: 2px solid #ccc;
    }
    .right-panel {
        width: 18%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
    .terminal {
        background-color: #000;
        color: #0f0;
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 10px;
        height: 100px;
        overflow-y: auto;
        white-space: pre-wrap;
        font-size: 12px;
    }
    .buttons {
        display: flex;
        flex-wrap: wrap;
        gap: 5px;
    }
    button {
        flex: 1 1 calc(50% - 10px);
        margin: 5px;
        padding: 5px;
        font-size: 12px;
        cursor: pointer;
        border: none;
        border-radius: 5px;
        background-color: #007BFF; /* Fond bleu par défaut */
        color: #fff;
        box-shadow: 2px 2px 4px #000; /* Relief sur les boutons */
    }
    button:hover {
        background-color: #0056b3;
    }
    .logo-container {
        text-align: center;
        padding: 10px;
        margin-left: -20px; /* Légère décalage vers la gauche */
    }
    .logo-container img {
        width: 150px; /* Agrandit l'image */
        height: auto;
    }
    .footer {
        text-align: right;
        font-size: 12px;
        color: #fff;
        padding: 5px;
        font-style: italic;
        font-family: 'Pacifico', cursive; /* Police stylée */
    }
</style>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const videoContainer = document.querySelector('.video-container');
        const videoElement = document.querySelector('img');
        const terminal = document.querySelector('.terminal');

        const logMessage = (message) => {
            const newMessage = document.createElement('div');
            newMessage.textContent = message;
            terminal.appendChild(newMessage);
            terminal.scrollTop = terminal.scrollHeight;
        };

        const sendCommand = (url, message) => {
            fetch(url)
                .then(response => {
                    if (response.ok) {
                        logMessage(${message} - Success);
                    } else {
                        logMessage(${message} - Failed);
                    }
                })
                .catch(err => logMessage(${message} - Error: ${err.message}));
        };

        document.addEventListener('keydown', function(event) {
            if (event.key === 'f' || event.key === 'F') {
                if (!document.fullscreenElement) {
                    videoElement.requestFullscreen().catch(err => {
                        logMessage(Error attempting to enable full-screen mode: ${err.message} (${err.name}));
                    });
                } else {
                    document.exitFullscreen();
                }
            } else if (event.key === '+') {
                sendCommand('/zoom?level=1', 'Zoom +');
            } else if (event.key === '-') {
                sendCommand('/zoom?level=-1', 'Zoom -');
            } else if (event.key === 'e' || event.key === 'E') {
                sendCommand('/toggle?feature=exposure', 'Toggle Exposure');
            } else if (event.key === 'ArrowLeft') {
                sendCommand('/rotate?direction=left', 'Rotated Left');
            } else if (event.key === 'ArrowRight') {
                sendCommand('/rotate?direction=right', 'Rotated Right');
            } else if (event.key === 'p' || event.key === 'P') {
                sendCommand('/capture_photo', 'Photo captured');
            } else if (event.key === 'a' || event.key === 'A') {
                sendCommand('/start_auto_photo', 'Starting automatic photo capture');
            }
        });
    });

    function rotateVideo(direction) {
        const videoContainer = document.querySelector('.video-container');
        const currentRotation = parseFloat(videoContainer.style.transform.replace('rotate(', '').replace('deg)', '')) || 0;
        const newRotation = currentRotation + (direction * 15);  // Rotate by 15 degrees
        videoContainer.style.transform = rotate(${newRotation}deg);
    }
</script>
</head>
<body>
<div class="container">
    <div class="video-container">
        <img src="stream.mjpg" alt="Streaming video" />
    </div>
    <div class="right-panel">
        <h1 data-text="La rasp de la vie en rust">La rasp de la vie en rust</h1>
        <div class="terminal"></div>
        <div class="buttons">
            <button data-action="/zoom?level=1" onclick="sendCommand('/zoom?level=1', 'Zoom +')">Zoom + / Raccourci clavier +</button>
            <button data-action="/zoom?level=-1" onclick="sendCommand('/zoom?level=-1', 'Zoom -')">Zoom - / Raccourci clavier -</button>
            <button data-action="/toggle?feature=exposure" onclick="sendCommand('/toggle?feature=exposure', 'Toggle Exposure ')">Toggle Exposure / Automatique</button>
            <button onclick="rotateVideo(-1)">Rotate Left/ Appuie sur l'icone</button>
            <button onclick="rotateVideo(1)">Rotate Right/ Appuie sur l'icone</button>
            <button data-action="/capture_photo" onclick="sendCommand('/capture_photo', 'Photo captured')">Capture Photo / Raccourci clavier p</button>
            <button data-action="/start_auto_photo" onclick="sendCommand('/start_auto_photo', 'Starting automatic photo capture')">Start Auto Photos / Raccourci clavier a </button>
        </div>
        <div class="logo-container">
            <img src="https://www.devinci.fr/wordpress/wp-content/uploads/2018/01/Logo_HydroVinci.jpg" alt="Logo">
        </div>
        <div class="footer">
            by Hugo PELTIER
        </div>
    </div>
</div>
</body>
</html>
"""









class StreamingOutput(io.BufferedIOBase):
    def _init_(self):
        self.frame = None
        self.condition = Condition()

    def write(self, buf):
        with self.condition:
            self.frame = buf
            self.condition.notify_all()

    def get_frame(self):
        with self.condition:
            return self.frame

class StreamingHandler(server.BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.send_response(301)
            self.send_header('Location', '/index.html')
            self.end_headers()
        elif self.path == '/index.html':
            content = PAGE_STREAM.encode('utf-8')
            self.send_response(200)
            self.send_header('Content-Type', 'text/html')
            self.send_header('Content-Length', len(content))
            self.end_headers()
            self.wfile.write(content)
        elif self.path == '/stream.mjpg':
            self.send_response(200)
            self.send_header('Age', 0)
            self.send_header('Cache-Control', 'no-cache, private')
            self.send_header('Pragma', 'no-cache')
            self.send_header('Content-Type', 'multipart/x-mixed-replace; boundary=FRAME')
            self.end_headers()
            try:
                while True:
                    with output.condition:
                        output.condition.wait()
                        frame = output.get_frame()
                    self.wfile.write(b'--FRAME\r\n')
                    self.send_header('Content-Type', 'image/jpeg')
                    self.send_header('Content-Length', len(frame))
                    self.end_headers()
                    self.wfile.write(frame)
                    self.wfile.write(b'\r\n')
            except Exception as e:
                logging.warning(
                    'Removed streaming client %s: %s',
                    self.client_address, str(e))
        elif self.path == '/capture_photo':
            try:
                capture_photo()
                self.send_response(200)
                self.end_headers()
            except Exception as e:
                self.send_error(400)
                self.end_headers()
        elif self.path == '/start_auto_photo':
            try:
                threading.Thread(target=take_photos_automatically).start()
                self.send_response(200)
                self.end_headers()
            except Exception as e:
                self.send_error(400)
                self.end_headers()
        elif self.path.startswith('/zoom'):
            try:
                level = int(self.path.split('=')[1])
                adjust_zoom(level)
                self.send_response(200)
                self.end_headers()
            except Exception as e:
                self.send_error(400)
                self.end_headers()
        elif self.path.startswith('/toggle'):
            try:
                feature = self.path.split('=')[1]
                if feature == 'exposure':
                    toggle_exposure_mode()
                self.send_response(200)
                self.end_headers()
            except Exception as e:
                self.send_error(400)
                self.end_headers()
        elif self.path.startswith('/adjust'):
            try:
                feature = self.path.split('=')[1]
                if feature == 'brightness':
                    adjust_brightness()
                elif feature == 'contrast':
                    adjust_contrast()
                elif feature == 'saturation':
                    adjust_saturation()
                self.send_response(200)
                self.end_headers()
            except Exception as e:
                self.send_error(400)
                self.end_headers()
        elif self.path.startswith('/rotate'):
            try:
                direction = self.path.split('=')[1]
                if direction == 'left':
                    adjust_rotation(-1)  # Rotate left by 1 degree
                elif direction == 'right':
                    adjust_rotation(1)  # Rotate right by 1 degree
                self.send_response(200)
                self.end_headers()
            except Exception as e:
                self.send_error(400)
                self.end_headers()
        else:
            self.send_error(404)
            self.end_headers()

class StreamingServer(socketserver.ThreadingMixIn, server.HTTPServer):
    allow_reuse_address = True
    daemon_threads = True

# Function to adjust camera zoom
zoom_level = 1.0
zoom_step = 0.1

def adjust_zoom(level):
    global zoom_level
    new_zoom = zoom_level + level * zoom_step
    if 1.0 <= new_zoom <= 2.0:  # Assuming the zoom range is from 1.0 to 2.0
        zoom_level = new_zoom
        # Adjust the zoom on the camera
        scaler_crop = {
            "ScalerCrop": (0, 0, 3280, 2464)  # full resolution of the camera
        }
        width = int(3280 / zoom_level)
        height = int(2464 / zoom_level)
        x = (3280 - width) // 2
        y = (2464 - height) // 2
        scaler_crop["ScalerCrop"] = (x, y, width, height)
        picam2.set_controls(scaler_crop)

# Function to toggle exposure mode
auto_exposure = True

def toggle_exposure_mode():
    global auto_exposure
    auto_exposure = not auto_exposure
    if auto_exposure:
        picam2.set_controls({"AeEnable": 1})  # Enable auto exposure
    else:
        picam2.set_controls({"AeEnable": 0})  # Disable auto exposure

# Functions to adjust other camera settings
def adjust_brightness():
    current_brightness = picam2.get_controls().get("Brightness", 0)
    new_brightness = current_brightness + 0.1
    picam2.set_controls({"Brightness": new_brightness})

def adjust_contrast():
    current_contrast = picam2.get_controls().get("Contrast", 1)
    new_contrast = current_contrast + 0.1
    picam2.set_controls({"Contrast": new_contrast})

def adjust_saturation():
    current_saturation = picam2.get_controls().get("Saturation", 1)
    new_saturation = current_saturation + 0.1
    picam2.set_controls({"Saturation": new_saturation})

# Function to adjust camera rotation
rotation_angle = 0

def adjust_rotation(direction):
    global rotation_angle
    rotation_angle += direction  # direction is either 1 or -1
    rotation_angle = rotation_angle % 360  # Ensure the angle stays within 0-359 degrees
    picam2.set_controls({"Rotation": rotation_angle})

# Function to capture a photo
photo_counter = 0

def capture_photo():
    global photo_counter
    output_dir = "/home/hugop/photogrammetry_photos"
    os.makedirs(output_dir, exist_ok=True)
    filename = os.path.join(output_dir, f"photo_{photo_counter:03d}.jpg")
    photo_counter += 1
    picam2.capture_file(filename)
    print(f"Photo captured: {filename}")

# Function to take photos automatically every 5 seconds
def take_photos_automatically():
    output_dir = "/home/hugop/photogrammetry_photos"
    os.makedirs(output_dir, exist_ok=True)
    num_photos = 36
    interval = 5  # Interval in seconds

    def take_photo(filename):
        picam2.start()
        time.sleep(2)  # Allow time for the camera to adjust
        picam2.capture_file(filename)
        picam2.stop()

    for i in range(num_photos):
        filename = os.path.join(output_dir, f"photo_{i:03d}.jpg")
        take_photo(filename)
        print(f"Photo {i + 1}/{num_photos} taken: {filename}")
        if i < num_photos - 1:  # Do not wait after the last photo
            print(f"Waiting {interval} seconds before taking the next photo...")
            time.sleep(interval)

# Camera setup
picam2 = Picamera2()
config = picam2.create_preview_configuration(main={"size": (1280, 720)})
picam2.configure(config)
output = StreamingOutput()
encoder = JpegEncoder()
picam2.start_recording(encoder, FileOutput(output))

if _name_ == "_main_":
    print("Streaming en direct...")
    address = ('', 8000)
    server = StreamingServer(address, StreamingHandler)
    server_thread = threading.Thread(target=server.serve_forever)
    server_thread.start()
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        server.shutdown()
        server.server_close()