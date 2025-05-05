# 🚀 Attend Ease

**Attend Ease** is a Flutter application designed for seamless attendance and leave management. Whether you're an HR or an employee, this app simplifies daily check-ins, approvals, and reporting—backed with location and biometric verifications.

---

## 👀 Overview

Attend Ease streamlines the attendance process using secure features like biometric verification and geo-location. It's a full-stack solution with distinct flows for HR and Employees, complete with leave management, reporting, and analytics.

---

## ⭐ Key Features

### 🧑‍💼 HR Features
- **Create Company Account** with physical location and geo-radius.
- **Add/Remove Employees** and assign unique employee IDs.
- **View Attendance** with calendar/history interface.
- **Submit Daily Reports** showing total presence.
- **Approve/Reject Leave Requests.**

### 👤 Employee Features
- **Mark Attendance** only within specified radius.
- **Biometric Verification** for clock-in/out.
- **View Attendance History** and daily logs.
- **Request Leaves** with reason, date & duration.

---

## 🖥️ Tech Stack

### Frontend:
- **Flutter** – Cross-platform UI
- **Provider** – State Management
- **Dart** – Programming language

### Backend:
- **Node.js** – API & logic
- **Express.js** – Server framework
- **MongoDB** – NoSQL database

---

## 📦 Flutter Packages Used

```yaml
cupertino_icons: ^1.0.6
another_carousel_pro: ^1.0.2
wolt_modal_sheet: ^0.7.1
page_transition:
lottie: ^3.1.2
flutter_native_splash:
flutter_spinkit:
skeletonizer: ^1.4.2
table_calendar:
shared_preferences:
provider:
cached_network_image: ^3.4.1
flutter_dotenv:
image_picker: ^1.1.2
path_provider:
http: ^1.2.2
connectivity_plus: ^6.1.1
geolocator: ^8.2.1
```

---

## 🗂️ Project Structure

### 📁 Flutter (Frontend)

```
lib/
├── helpers/           # Utility functions
├── models/            # Data models
├── provider/          # App state
├── screens/           # UI Screens: Login, Home, History, etc.
├── services/          # API handlers
├── styling/           # Themes and Colors
├── widgets/           # Reusable Components
└── main.dart
```

### 📁 Node.js (Backend)

```
backend/
├── routes/            # API routes
├── controllers/       # Logic handlers
├── middlewares/       # JWT/Auth, validation
├── config/            # DB connections
├── models/            # Mongoose schemas
└── index.js           # Server entry point
```

---

## 📦 Backend Dependencies (package.json)

```json
{
  "bcryptjs": "^2.4.3",
  "body-parser": "^1.20.2",
  "cloudinary": "^2.5.1",
  "cors": "^2.8.5",
  "crypto": "^1.0.1",
  "dotenv": "^16.4.5",
  "express": "^4.19.2",
  "http": "^0.0.1-security",
  "jsonwebtoken": "^9.0.2",
  "mongoose": "^8.5.1",
  "multer": "^1.4.5-lts.1",
  "nodemon": "^3.1.4",
  "otp-generator": "^4.0.1",
  "twilio": "^5.2.2"
}
```

---

## 🛠️ Setup & Installation

### 🔧 Prerequisites

- Flutter SDK
- Node.js & npm
- MongoDB

### 🔌 Clone Repository

```bash
git clone https://github.com/yourusername/attend-ease.git
cd attend-ease
```

### 🔙 Backend Setup

```bash
cd backend
npm install
# Create .env file from .env.example
npm run dev
```

### 📲 Frontend Setup

```bash
cd frontend
flutter pub get
flutter run
```

---

## 🎮 Usage Guide

### For HR
- Login → Set company location & radius
- Add employees with name, phone, etc.
- View attendance logs
- Approve/reject leave requests
- Submit daily attendance summary

### For Employees
- Login via Employee ID
- Mark attendance (location + biometric check)
- View attendance calendar
- Apply for leave with reason & date

---

## 👥 Contributing

We welcome all contributions!

1. Fork this repository.
2. Create your branch: `git checkout -b feature/YourFeature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/YourFeature`
5. Open a pull request 🎉

---

## 📄 License

This project is licensed under the **MIT License** – feel free to use, modify, and distribute!

---

## 🙌 Team

Made with 💙 by Team **AttendEase**