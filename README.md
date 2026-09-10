# IoT-Based-RFID-Student-Identification-System

An IoT-based RFID attendance and access management system designed for real-world doorway deployment. The system integrates an ESP32, RFID reader, LCD display, and MQTT communication into a compact enclosed unit.

Users can scan their RFID cards at the entrance, allowing the system to identify registered users and transmit the RFID data for attendance or access processing.

🚀 Features
RFID-based user identification
ESP32 IoT controller
RC522 RFID reader
LCD-based user feedback
Wi-Fi connectivity
MQTT data transmission
Compact enclosed hardware design
Designed for doorway/entrance deployment
Suitable for attendance and access management
🏗️ System Flow
        RFID Card
            ↓
       RFID Reader
            ↓
          ESP32
            ↓
       User Validation
            ↓
      LCD Feedback
            ↓
       Wi-Fi / MQTT
            ↓
   Attendance / Backend
🛠️ Hardware
ESP32
RC522 RFID Module
RFID Cards/Tags
LCD Display
Breadboard / PCB-based connections
Power Supply
Enclosure
💻 Technologies
C/C++
Arduino IDE
ESP32
RFID
MQTT
Wi-Fi
IoT
📦 Product Deployment

The electronics are integrated into a protective enclosure and installed at the entrance/doorway, transforming the prototype into a practical standalone RFID identification unit.

┌─────────────────────────┐
│                         │
│      RFID READER        │
│                         │
│      LCD DISPLAY        │
│                         │
│   ESP32 + Electronics   │
│                         │
└─────────────────────────┘
          │
       Doorway
📊 RFID Identification

Each RFID card has a unique UID that can be mapped to a registered user.

RFID Card
   ↓
Unique UID
   ↓
User Database
   ↓
User Identification
   ↓
Attendance / Access Record
📡 MQTT Communication

The ESP32 publishes scanned RFID information through MQTT, allowing a backend or monitoring application to receive and process the data remotely.

🎯 Applications
Student attendance
Employee attendance
Door access management
Campus entry systems
Office access systems
Smart building systems
IoT-based identification
🔮 Future Improvements
Automatic door-lock integration
Cloud-based attendance dashboard
Real-time notifications
Online user management
Database integration
Attendance analytics
PCB-based hardware design
Network monitoring
📌 Project Status

Status: Deployed Prototype / Working Product

The system was developed from a hardware prototype into an enclosed unit designed for practical installation at a doorway.

👨‍💻 Author

Rohan Immidichetty
