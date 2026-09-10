# IoT-Based-RFID-Student-Identification-System

# 📡 **Smart RFID Attendance & Access System**

> ### 🚪 **A Product-Style IoT Solution for Smart Attendance & Access Management**
> <img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/88b8d527-c3fc-46b7-9c8e-6736ccd9094c" />


A **real-world RFID-based identification system** built using **ESP32 and RC522**, designed and integrated into a **compact enclosed unit installed at a doorway**.

The system reads RFID cards, identifies registered users, provides **real-time LCD feedback**, and transmits RFID data through **Wi-Fi and MQTT** for backend processing.

---

## ✨ **Key Features**

🔐 **RFID-Based Identification**
Identify users using their unique RFID card UID.

📡 **IoT Connectivity**
Transmit RFID data wirelessly using **Wi-Fi + MQTT**.

🖥️ **Real-Time LCD Feedback**
Display scanning and system status directly on the device.

⚡ **ESP32 Powered**
Efficient embedded controller for RFID processing and communication.

🏢 **Real-World Deployment**
Electronics integrated into a **protective enclosure** and installed near a doorway.

📊 **Attendance & Access Ready**
Designed as a foundation for **automated attendance and access management**.

---<img width="1280" height="720" alt="image" src="https://github.com/user-attachments/assets/b8704a10-0407-44e7-8a4b-16736dba44b2" />


## 🏗️ **System Architecture**

```text
                 ┌──────────────┐
                 │  RFID Card   │
                 └──────┬───────┘
                        ↓
                 ┌──────────────┐
                 │ RC522 Reader │
                 └──────┬───────┘
                        ↓
                 ┌──────────────┐
                 │    ESP32     │
                 └──────┬───────┘
                        ↓
                 ┌──────────────┐
                 │ Identification│
                 └──────┬───────┘
                        ↓
                 ┌──────────────┐
                 │ LCD Feedback │
                 └──────┬───────┘
                        ↓
                 ┌──────────────┐
                 │ Wi-Fi / MQTT │
                 └──────┬───────┘
                        ↓
                 ┌──────────────┐
                 │   Backend    │
                 └──────────────┘
```

---

## 🛠️ **Technology Stack**

| **Category**       | **Technology**  |
| ------------------ | --------------- |
| 🔧 Microcontroller | **ESP32**       |
| 📡 RFID            | **RC522**       |
| 💻 Programming     | **C/C++**       |
| 🛠️ Development    | **Arduino IDE** |
| 📶 Connectivity    | **Wi-Fi**       |
| ☁️ Communication   | **MQTT**        |
| 🖥️ Display        | **LCD**         |
| 🌐 Architecture    | **IoT**         |

---

## 📡 **How It Works**

### **1️⃣ RFID Scanning**

The user brings an RFID card close to the **RC522 reader**.

### **2️⃣ UID Extraction**

The **ESP32 reads the unique RFID UID** from the card.

### **3️⃣ User Identification**

The UID can be matched with registered user information.

### **4️⃣ LCD Feedback**

The device provides immediate feedback through the **LCD display**.

### **5️⃣ MQTT Transmission**

The ESP32 sends the RFID information through **Wi-Fi using MQTT**.

### **6️⃣ Backend Processing**

The received information can be used for **attendance or access records**.

---

## 📦 **Product Implementation**

Unlike a basic breadboard prototype, the system was developed into a **compact enclosed hardware unit** designed for practical installation.

### **Deployment**

```text
             ┌─────────────────────┐
             │   RFID ACCESS UNIT   │
             │                     │
             │    📡 RFID READER   │
             │                     │
             │    🖥️ LCD DISPLAY   │
             │                     │
             │    ⚡ ESP32 + IoT    │
             │                     │
             └─────────────────────┘
                       │
                       ↓
                    🚪 DOOR
```

The unit can be positioned **at the entrance of a classroom, laboratory, office, or other controlled area**.

---

## 🎯 **Applications**

🎓 **Student Attendance**

🏢 **Employee Attendance**

🚪 **Door Access Management**

🏫 **Campus Entry Systems**

🏭 **Industrial Access Control**

🏠 **Smart Building Systems**

---

## 🔮 **Future Enhancements**

* 🔒 **Automatic door-lock integration**
* ☁️ **Cloud-based attendance dashboard**
* 📊 **Attendance analytics**
* 🔔 **Real-time notifications**
* 🗄️ **Centralized database**
* 📱 **Mobile application**
* 🖥️ **Web-based monitoring**
* 🔧 **Custom PCB design**
* 📡 **Remote device monitoring**

---

## 📌 **Project Status**

### 🟢 **Working Prototype / Deployed System**

The project has been developed from a **hardware prototype into an enclosed, product-oriented RFID system** suitable for doorway deployment.

---

## 👨‍💻 **Author**

### **Rohan Immidichetty**

> ⭐ **Built with IoT, Embedded Systems & Automation**

