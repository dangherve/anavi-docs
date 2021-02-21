# ANAVI Fume Extractor

**The open source smart solder smoke absorber**

---

# DISCLAIMER

ANAVI, the ANAVI logo and combinations thereof, are registered trademarks of Leon Anavi. Other product names may be trademarks of others and the rights belong to their respective owners.

The information in this document is provided in connection with Anavi products. No license, express or implied
or otherwise, to any intellectual property right is granted by this document or in connection with the sale of Anavi products.

This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0).
this license, visit https://creativecommons.org/licenses/by-sa/4.0/.

ANAVI Fume Extractor hardware design is licensed under a Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0).

The software examples are released under MIT and the rest of the software is available under GPLv3.

It is possible that the pictures in this manual differ from the latest revision of the board.

The product described in this document is subject to continuous development and improvements. All particulars of the product and its use contained in this document are given by ANAVI in good faith. However all warranties implied or expressed including but not limited to implied warranties of merchantability or fitness for purpose are excluded. This document is intended only to assist the reader in the use of the product. ANAVI shall not be liable for any loss or damage arising from the use of any information in this document or any error or omission in such information or any incorrect use of the product.

This evaluation board/kit is intended for use for engineering development, demonstration, or evaluation purposes only and is not considered by ANAVI to be a finished end-product fit for general consumer use. People handling the product must have electronics training and observe good engineering practice standards. As such, the goods being provided are not intended to be complete in terms of required design-, marketing-, and/or manufacturing-related protective considerations, including product safety and environmental measures typically found in end products that incorporate such semiconductor components or circuit boards.

There is no warranty for the design materials and the components used to create ANAVI Fume Extractor. There are considered suitable only for ANAVI Fume Extractor.

---

# CHAPTER 1: Overview

## Introduction

ANAVI Fume Extractor is a smart, open source, solder smoke absorber. It is powered by a Wi-Fi development board with an ESP8266, an 80 mm fan, and a replaceable filter. ANAVI Fume Extractor has dedicated slots for a mini OLED I²C display and a MQ-135 gas sensor module, as well as slots for up to three additional I²C sensor modules for measuring temperature, humidity, light, and barometric pressure. Furthermore, there are UART pins for easy flashing of custom firmware and an extra GPIO for connecting external peripherals.

Soldering is fun, but soldering fumes are dangerous to your health. Stay safe and healthy by using a fume extractor. Existing products on the market are bulky, noisy, and lack smart features. The alternative is ANAVI Fume Extractor. Dangerous fumes during soldering and air pollution is a very serious problem. Monitoring air quality and detecting toxic gases can improve one's quality of life. All these features make ANAVI Fume Extractor appropriate for developers, makers, students and open source enthusiasts who are interested in home automation and an environmentally friendly lifestyle.

ANAVI Fume Extractor is designed with the free and open source electronics design automation suite [KiCAD](http://kicad-pcb.org/). No soldering is required. You can assemble ANAVI Fume Extractor with your bare hands and a screwdriver.

## Features & Specifications

* **Fan:** 80 mm, 5 V DC, 0.25 A with replaceable filter
* **CPU:** Tensilica L106 32-bit processor (ESP8266)
* **Connectivity:** Wi-Fi 802.11 b/g/n
* **Gas sensor support:** MQ-135 for air quality or any other 5 V MQ analog gas sensor
* **Peripherals:** Mini OLED display, UART pins for flashing custom firmware, button, three slots for I²C sensors
* **Compatibility:** Arduino IDE, PlatformIO, Home Assistant, OpenHAB, ThingSpeak, MQTT, and any modern web browser
* **Certification:** Open Source Hardware Association (OSHWA) BG000060
* **Dimensions:** 80x129x54 mm

## Target Market

ANAVI Fume Extractor is easy to use. You don’t need to be a tech whiz to use it. You can assemble it without any tools, and only a screwdriver is needed to mount the fan and the OLED display to the acrylic enclosure. Whether you're a newbie to home automation or a skilled engineer, ANAVI Fume Extractor is a great choice for many projects.

ANAVI Fume Extractor can also serve as a convenient development board for home automation. The additional slots for I²C sensor modules makes it suitable for anyone interested in Internet of Things, coding, or open source.

ANAVI Fume Extractor is fully compliant with **Arduino IDE**, **PlatformIO**, the popular open source home automation software platforms **Home Assistant** and **OpenHAB** via the lightweight messaging protocol **MQTT**. With ANAVI Fume Extractor, it is easy for developers to focus on the software by easily building and flashing their own versions of the source code. Tech-savvy users can easily integrate ANAVI Fume Extractor in their existing open source home automation platforms.

## Board Version

Revision 1.0 of ANAVI Fume Extractor was used while writing this document. It is possible that it is outdated so it is always recommended to check the latest sources from the GitHub page of the board.

# CHAPTER 2: Getting Started

## Electrostatic Warning

ANAVI Fume Extractor board is shipped in a protective bag. It must **NOT** be exposed to high electrostatic potentials. A grounding strap or similar protective device should be worn when handling the board. Avoid touching the component pins or any other metallic element.

## Requirements

In order to setup ANAVI Fume Extractor the following items are required:

* 5V power supply with microUSB

It is recommended to use 1A (1000mA) or higher power supply.

## Supported Peripherals

ANAVI Fume Extractor has a slot for analog 5V MQ sensor module (MQ-135, MQ-2, MQ-3, MQ-7, etc.), I2C slot for mini OLED display as well as up to 3 slots I2C sensors.

### Sensors

ANAVI Fume Extractor supports 5V analog MQ sensor modules. The additional officially supported I2C add-on sensor modules are for:

* Temperature and humidity (HTU21D)
* Temperature and barometric pressure (BMP180)
* Light (BH1750)
* Color and gesture recognition (APDS-9960)

You may also attach any other I2C sensors but you will have to take care of their software integration.

#### Light Sensor

The official light I2C sensor for ANAVI Fume Extractor is BH1750.

Using 4 Dupont jumper wires connect BH1750 to one of the 3 I2C slots on ANAVI Fume Extractor as follows:

| BH1750   | ANAVI Fume Extractor |
| -------- |:-------------- |
| VCC      | 3.3V           |
| GND      | GND            |
| SCL      | SCL            |
| SDA      | SDA            |


#### I2C External Temperature & Humidity Sensor

The official external temperature and humidity add-on sensor for ANAVI Fume Extractor is HTU21 (SHT21). This is I2C sensor capable of measuring both humidity and temperature.

Using 4 Dupont jumper wires connect HTU21 to one of the 3 I2C slots on ANAVI Fume Extractor as follows:

| HTU21    | ANAVI Fume Extractor |
| -------- |:-------------- |
| VIN      | 3.3V           |
| GND      | GND            |
| SCL      | SCL            |
| SDA      | SDA            |

#### Color & Gesture Recognition Sensor

The official I2C sensor for RGB color and gesture detection is APDS-9960.

Using 4 Dupont jumper wires connect APDS-9960 to one of the 3 I2C slots on ANAVI Fume Extractor as follows:

| APDS-9960  | ANAVI Fume Extractor |
| ---------- |:-------------- |
| VIN        | 3.3V           |
| GND        | GND            |
| SCL        | SCL            |
| SDA        | SDA            |

#### Temperature & Barometric Pressure Sensor

The official temperature and barometric pressure sensor for ANAVI Fume Extractor is BMP180. This is I2C sensor capable of measuring both temperature and barometric pressure.

Using 4 Dupont jumper wires connect BMP180 to one of the 3 I2C slots on ANAVI Fume Extractor as follows:

| BMP180   | ANAVI Fume Extractor |
| -------- |:-------------- |
| VIN      | 3.3V           |
| GND      | GND            |
| SCL      | SCL            |
| SDA      | SDA            |

## Assembly

The following assembly guidelines are available:

* [ANAVI Fume Extractor Assembly Guide (with images)](https://www.crowdsupply.com/anavi-technology/fume-extractor/updates/video-anavi-fume-extractor-assembly-guide)
* [ANAVI Fume Extractor Video Assembly Guide](https://www.youtube.com/watch?v=jscFGFjlJsU)

ANAVI Fume Extractor comes as a do-it-yourself kit. There are 3 types of kits: starter, advanced and developer. The difference is in the number of included sensor modules. The developer kit contains all supported peripherals.

This tutorial explains the exact steps of how to assemble the ANAVI Fume Extractor developer kit. The whole process can take up to 30-40min. A screwdriver is required. It is highly recommended [to watch the video with the assembly guidelines before you start](https://www.youtube.com/watch?v=jscFGFjlJsU).

### Step 1: Peel off the protective films

Each ANAVI Fume Extractor kit contains 4 acrylic enclosures. Peel off the protective films from both sides of all of them. The acrylic enclosure will be clear and transparent once the film is peeled off.

### Step 2: PCB

Attach the ANAVI Fume Extractor printed circuit board to the bottom acrylic enclosure with 4 screws and 8 nuts. Add 4 nuts below and 4 nuts above the board.

### Step 3: Mini OLED Display

The kit includes 4 M2 screws and nuts as well as appropriate washers. Remove the protective film from the mini I2C OLED display. Carefully attach the display to the front acrylic case as shown in the video. The display is fragile. Don’t fasten the screws too tight!

### Step 4: Fan Filter

A couple of fan filters are included in each kit. Attach the 4 M4 screws to the front acrylic enclosure with 4 of the M4 nuts. Pay attention to the alignment of the acrylics at the start of the process. The display is on the left and the gas sensor on the right of the front panel (when looking at it from the front).

Place one of the filters. Leave the other one as a replacement.

For long-term maintenance over time the filter must be regularly replaced. There is a huge variety of 80mm fan filters on the market. It is up to you to decide whether to buy carbon or HEPA filters. Various distributors offer appropriate filters, for example Mouser has 80 mm, 45 PPI foam media filters.

### Step 5: Fan

Add the acrylic enclosure that separates the fan from the filter. On the side of the fan you will notice a label that indicates the direction of the air flow. Place the 80mm 5V DC fan so that the air will flow through the filter.

Screw the 4 M4 20mm stand-offs to firmly fix the position of the fan.

### Step 6 (optional): Light Sensor Module

Owners of a developer kit should add the BH1750 light sensor module to the front acrylic enclosure and fix it with one M4 screw and a nut.

### Step 7: Peripherals

Connect peripherals, like the fan and the mini OLED display, to the printed circuit board. There are dedicated connectors for both of them. Pay attention to the labels for I2C on the top of the mini OLED display.

### Step 8 (optional): Sensors

Owners of advanced or developer kits should attach:

* MQ-135 for indoor air quality
* HTU21D I2C sensor module for temperature and humidity
* BMP180 I2C sensor module for barometric pressure and temperature.

### Step 9: Assemble all acrylic enclosures

Finally, assemble together all acrylic enclosures by fastening 4 M4 nuts on the back of ANAVI Fume Extractor.

On the right side of ANAVI Fume Extractor you will notice a jumper for the **WiFi** as well as a button to switch the filter on and off. By default the jumper for the **WiFi** is set to **OFF**. Move it to **ON** and power cycle the board if you want to connect ANAVI Fume Extractor to a MQTT broker and IoT platform such as the popular open source system Home Assistant.

## Powering ANAVI Fume Extractor

To turn ANAVI Fume Extractor on, gently plug an appropriate cable and 5V power supply into the microUSB connector on the left side of the board. The microUSB connector is used only for providing power, no data is transferred. Power supply and microUSB cable are NOT included in any of the kits.

It is recommended to use 5V power supply with 1A or higher current output. Make sure that you are using a 5V power supply from a trusted supplier. Cheap, untested power supplies can be risky and unreliable.

## Configure ANAVI Fume Extractor

[Video tutorial for getting started with ANAVI Light Controller, same procedure for ANAVI Fume Extractor](https://www.youtube.com/watch?v=Y_81CuuGm0Y)

Set the WiFi jumper to **ON**. Turn on ANAVI Fume Extractor by plugging an appropriate power supply. As soon as the board is turned on for the very first time it will create a temporary WiFi access point. Connect to it from your computer, smartphone or tablet.

The default software of ANAVI Fume Extractor has a captive portal which guides you through the configurations. As you see in the video you have to select your WiFi network and enter a password if it is not open.

Our open source software relies on the machine to machine communication protocol MQTT to report data from the sensors. You can connect to your own MQTT broker or just leave the default configurations and connect to the public broker as shown in the video.

It very important to copy the machine ID. Later it is needed to identify your device.

When you are ready just click save. If you have entered valid credentials in a moment ANAVI Fume Extractor will connect to your WiFi network and the configured MQTT broker. This way the configuration is complete and ANAVI Fume Extractor will turn off its temporary WiFi access point. After that your device, for example smartphone as in the video, will automatically connect again to your WiFi network.

To verify that ANAVI Fume Extractor is up and running open a modern web browser and visit demo.anavi.technology. Enter your machine ID. Check the advanced settings only if you are not using the default public MQTT broker. Click connect.

## Reset to Factory Defaults

If you decide to change the settings of ANAVI Fume Extractor you need to reset the board and configure it again.

To reset ANAVI Fume Extractor press the button and hold it for 10 seconds until the red light is blinking. After resetting the board there will be a steady red light that indicates that the temporary WiFi access point is on and you can proceed with the configuration again.

---

# CHAPTER 3: Software Development

## Default Firmware

By default ANAVI Fume Extractor comes with [this free and open source Arduino sketch](https://github.com/AnaviTechnology/anavi-fume-extractor-sw).

## USB to UART Module

For uploading firmware to ANAVI Fume Extractor you need USB to UART module. All kits include CP2102 which out of the box on GNU/Linux distributions. Drivers for MS Windows and Mac OS X are [available at silabs.com](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers).

## Setting up the Arduino IDE

1. Install the Arduino IDE following the instructions from from https://www.arduino.cc/en/Main/Software

2. Add the ESP8266 board package: In **File > Preferences** input http://arduino.esp8266.com/stable/package_esp8266com_index.json into the Additional Board Manager URLs field.

3. In **Tools > Board ... > Boards manager** find and add the **ESP8266** package. Now "Generic ESP8266" should be an option in the **Tools > Boards** menu.

4. In **Tools > Flash Size:** select **4M (1M SPIFFS)** 

5. Go to **Sketch > Include Library > Manage Libraries...** and include the following dependencies of the default firmware for ANAVI Fume Extractor:

* WiFiManager by tzapu (version 0.15.0)
* ArduinoJson by Benoit Blanchon (version 6.11.2)
* PubSubClient by Nick O'Leary (version 2.7.0)
* Adafruit HTU21DF Library by Adafruit (version 1.0.1)
* Adafruit APDS9960 Library by Adafruit (version 1.0.5)
* DHT sensor library by Adafruit (version 1.3.4)
* U8g2 by oliver (version 2.23.18)
* OneWire (version 2.3.4)
* DallasTemperature (version 3.8.0)
* Adafruit Unified Sensor by Adafruit (version 1.0.2)
* Adafruit BMP085 Unified by Adafruit (version 1.0.0)

*Note: Issues might be experienced if using different versions of the libraries.*

## Flashing Custom Firmware

Follow the steps below to compile and flash custom firmware on ANAVI Fume Extractor from Arduino IDE:

1. To flash the firmware from Arduino IDE select Tools > Generic ESP8266 Module:
    - Upload speed: 115200
    - CPU frequency: 80MHz
    - Flash size: 4MB  (FS:1M[..] ?
    - Flash mode: DIO
    - Flash frequency: 40MHz
    - Debug port: Disabled
    - Debug level: None
    - Reset method: no dtr (aka ck)
    - Port: /dev/ttyUSB0 
Set the flash size to 4M (1M SPIFFS). You might need to adjust the port if your USB to serial debug cable is connected on a different port.

2. After that press load an Arduino sketch. [A simple blinking LED example is available at GitHub](https://github.com/AnaviTechnology/anavi-examples/blob/master/anavi-light-controller/anavi-blinking-led/anavi-blinking-led.ino)

3. In Arudino IDE click Verify/Compile (Ctrl+R)

4. Connect ANAVI Fume Extractor to the USB to serial debug board: GND to GND, TX cable to RX of ANAVI Fume Extractor and RX cable to TX of ANAVI Fume Extractor.

5. In Arudino IDE click Upload (Ctrl+U)

6. Press and **hold** the RESET button on ANAVI Fume Extractor. Plug the 5V power supply in the jack of ANAVI Fume Extractor (without releasing the RESET button).

7. In Arduino IDE verify that the upload has been started. Hold RESET until the upload completes.

The output in Arduino IDE for successful flashing is:

```
Archiving built core (caching) in: /tmp/arduino_cache_954939/core/core_esp8266_esp8266_generic_CpuFrequency_80,FlashFreq_40,FlashMode_dio,UploadSpeed_115200,FlashSize_512K64,ResetMethod_ck,Debug_Disabled,DebugLevel_None_____1c2aa2b3da66da225b39c9bfab6531e5.a
Sketch uses 224949 bytes (51%) of program storage space. Maximum is 434160 bytes.
Global variables use 31756 bytes (38%) of dynamic memory, leaving 50164 bytes for local variables. Maximum is 81920 bytes.
Uploading 229104 bytes from /tmp/arduino_build_904122/anavi-blinking-led.ino.bin to flash at 0x00000000
................................................................................ [ 35% ]
................................................................................ [ 71% ]
................................................................                 [ 100% ]
```

If you have flashed the blinking LED example, D1 on ANAVI Fume Extractor with start blinking.

Please have a look at [the YouTube video that shows the exact steps for compiling and uploading an Arduino sketch to a similar of our boards](https://www.youtube.com/watch?v=HMIkPuz0ZJs).

**Note:** you have to be quick between step 5 and 6. Remember to press and **hold** SW1 until the upload completes.

# OTA Firmware Upgrade
Recent versions of the official firmware also support OTA firmware updates by putting a firmare binary on a web server and then triggering the update via a MQTT message. This can be very convenient, as you do not have to connect the device to your computer.

## Check support
If you are unsure if your current firmware supports OTA update, you can first check if your ANAVI Fume Extractor is already setup to receive MQTT commands.

To do this, send a MQTT message to the topic "cmnd/[deviceId]/line1" with message body "test", for example using mosquitto_pub:

```
mosquitto_pub -h [mqttserver] -p 1883 -t cmnd/b5cfb5cfb5cfb5cfb5cfb5cfb5cfb5cf/line1 -u [mqttuser] -P [mqttpass] -m "test"
```

When this message causes the first line of your ANAVI Fume Extractor display to change to "test", OTA updates should be supported.
If not (after double checking that you used the correct topic and deviceId), please first update to a more recent firmware version.

(To reset the line again to the default display, just send an empty message to the same topic).


## Build binary firmware image
Using the arduino build setting above, instead of clicking Upload (Ctrl+U), use Menu Sketch -> Export compiled binary (CTRL+ALT+S). A .bin file will be created in the same folder as the .ino file.
Copy this file to an HTTP webserver, for example a server in your local network.

## Trigger update
The devices listens to MQTT messages in topic "cmnd/[deviceid]/update" and expects messages to be in the format

```
{"file":"/[filePath]", "server": "[server IP or DNS name]"}
```

For example, if you put the file at http://192.168.100.46/anavi.bin:

```
{"file":"/anavi.bin", "server": "192.168.100.46"}
```

If your server does not listen on port 80, you can provide the port, for example for  http://192.168.100.46:8080/anavi.bin:

```
{"file":"/anavi.bin", "server": "192.168.100.46", "port": 8080}
```

Example for sending an update message using `mosquitto_pub`:

```
mosquitto_pub -h [mqttserver] -p 1883 -t cmnd/b5cfb5cfb5cfb5cfb5cfb5cfb5cfb5cf/update -u [user] -P [password] -m "{\"file\":\"anavi.bin\", \"server\":\"192.168.100.46\", \"port\":8080}"
```

***Note 1: Replace `[mqttserver]` with the IP of the MQTT broker, `[user]` with the MQTT username and `[password]` with the MQTT user's password.**

***Note 2: To ensure successful update, please specify the file with leading slash ('/'), use an HTTP web server, not HTTPS, and -- when run from the command line -- escape quote characters***

On receipt of this message, ANAVI Fume Extractor will download the file from the specified server, update the firmware and restart. As with the normal firmware update, your saved settings such as WiFi and MQTT server settings should remain as configured.

# CHAPTER 4: Home Assistant

[Home Assistant](https://home-assistant.io/) is a free and open-source home automation platform running on Python 3 with more than 1200 components for integration with popular Internet of Things.

ANAVI Fume Extractor can be easily integrated in Home Assistant using the component [MQTT sensor](https://www.home-assistant.io/components/sensor.mqtt/). This component supports JSON in the payload of the MQTT messages. To use, in **configuration.yaml** specify MQTT broker and register the sensor with the correspoding MQTT topic, for example:

* Configure MQTT broker:

```
mqtt:
  broker: 127.0.0.1
```

* Register the MQTT sensor:

```
sensor:
    - platform: mqtt
      name: "Temperature"
      unit_of_measurement: 'C'
      state_topic: "home/room/temperature"
      value_template: "{{value_json.temperature}}"
    - platform: mqtt
      name: "Humidity"
      unit_of_measurement: '%'
      state_topic: "home/room/humidity"
      value_template: "{{value_json.humidity}}"
```

# CHAPTER 5: MQTT

[MQTT](https://mqtt.org/) is a lightweight machine-to-machine real-time messaging protocol. If the WiFi jumper is enabled on boot, the [default open source firmware of ANAVI Fume Extractor](https://github.com/AnaviTechnology/anavi-fume-extractor-sw) uses MQTT to report data from the sensors and to control the fan.

After establishing a connection to the configured MQTT broker:

* To turn **ON** the fan send MQTT message with  topic `workgroup/[deviceid]/fan` with payload `{"fan":true}`

* To turn **OFF** the fan send MQTT message with  topic `workgroup/[deviceid]/fan` with payload `{"fan":false}` (or any other value that is not `true`)

**NOTE**: Replace `[deviceid]` with the actual device ID with is printed during the initial configuration of the fume extractor as well as in the serial console output on boot. Please note you may need to replace `workgroup` if you have configured a different name during the initial setup.

---

# CHAPTER 6: Schematics

## Pinout

The components of ANAVI Fume Extractor relies on ESP8266 (ESP-12 module) and utilizes the following pins:

| Component           | Pins                            |  Arduino Pin ID |         ESPHome          |
| ------------------- |:------------------------------- |-----------------|--------------------------|
| I2C                 | 13, 14                          |                 | GPIO4 (sda), GPIO5 (scl) |
| MQ gas sensor       | 2                               | 0 (analog)      | A0                       |
| Indication LED (D1) | 4                               | 16              | GPIO16                   |
| Fan On/Off button   | 7                               | 13              | GPIO13                   |
| Relay               | 6                               | 12              | GPIO12                   |
| WiFi On/Off Jumper  | 5                               | 14              | GPIO4                    |
| Reset button (SW1)  | 12                              | 0               | GPIO0                    |
| Extra GPIO          | 11                              | 2               | GPIO2                    |
| UART                | 15, 16                          |                 |                          |

## I2C

The sensors that can be connected to ANAVI Fume Extractor communicate with a host microcontroller via a communications standard called **I2C** (Inter-Integrated-Circut). I2C uses two wires, labelled SDA (Serial Data) and SCL (Serial Clock). To function properly, I2C requires a pullup resistor on each of those lines therefore ANAVI Fume Extractor includes two 4.7kohm resistors labelled as R2 and R3. If for one reason or another you need to disable the I2C pullup resistors remove R2 and R3.

---

# CHAPTER 7: Frequently Asked Questions (FAQ)

#### What power supply do I need?

You need a standard 5V power supply with microUSB connector.

#### Why isn't a power supply included?

We were unable to source power supplies with universal plugs for the US/EU/UK at an acceptable. Nowadays, 5V power supplies with a microUSB connector are a commodity item because of most smartphone and tables, so you should be able to easily find a suitable unit online or at your local electronics store.

#### Can I remotely control ANAVI Fume Extractor from a web browser on my smartphone, tablet, or laptop?

Yes, you can use our [demo website](http://demo.anavi.technology/) or easily integrate ANAVI Fume Extractor in your instance of the popular open source platforms [OpenHab 2](https://www.openhab.org/) and [Home Assistant](https://home-assistant.io/) through the protocol MQTT.

#### Is ANAVI Fume Extractor an open source project?

Yes, ANAVI Fume Extractor is an open source hardware project powered and created with free and open source software. The hardware designs are available at [GitHub under CC BY-SA 4.0 license](https://github.com/AnaviTechnology/anavi-fume-extactor). All schematics, documents, and source code files are available at [our GitHub repositories](https://github.com/AnaviTechnology/).

#### Is ANAVI Fume Extractor certified?

ANAVI Fume Extractor has been certified by [the Open Source Hardware Association under OSHWA UID BG000060](https://certification.oshwa.org/bg000060.html).

#### Does ANAVI Fume Extractor use the ESP8266?

Yes, ANAVI Fume Extractor is based on the ESP8266.

#### Can I flash different firmware to ANAVI Fume Extractor?

Yes, using a USB to serial cable, you can flash custom firmware built from your own source code.

#### Is ANAVI Fume Extractor compatible with Arduino IDE?

Yes, ANAVI Fume Extractor is compatible with Arduino IDE. You can easily upload your own Arduino sketches to the board.

#### How can I get involved and help?

Buy any of the available perks, get your hands on the ANAVI Fume Extractor, contribute to our GitHub repositories, and become part of our open source community!


---

# CHAPTER 8: Revision History

## Document Revision

| Date              | Changes                     | Modified pages  | Author          |
| ----------------- |:---------------------------:| :---------------| :---------------|
| 16 November 2019  | Initial release             | All             | Leon Anavi      |
| 6 November 2020   | Assembly guidelines         | All             | Leon Anavi      |
| 7 November 2020   | ESPHome notes and OSHWA UID | All             | Leon Anavi      |

## ANAVI Fume Extractor Revision

| Revision| Notable changes                                              |
| ------- |:-------------------------------------------------------------|
| 1.0     | Stable product                                               |

## See Also

For more information please visit [anavi.technology](http://anavi.technology/) and our [GitHub repositories](https://github.com/AnaviTechnology). If you have any questions or enquiries please contact us through [Facebook](https://www.facebook.com/AnaviTechnology/), [Twitter](https://twitter.com/AnaviTechnology) or [email](mailto:info@anavi.technology).

---
