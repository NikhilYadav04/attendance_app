# 🚀 Attend Ease

**Attend Ease** is a Flutter + Node.js application for seamless attendance and leave management. Designed for companies of all sizes, it gives HR admins full control over employee attendance, location boundaries, leave approvals, and reporting — while giving employees a clean interface to mark attendance, apply for leave, and communicate via video calls.

---

## 🚀 Check App Preview

Click below to check the preview of the full UI and features:

🔗 [View the Preview](https://drive.google.com/drive/folders/1Kkn_ml5LFtfU1HJpjlMVJMauZxpznDkR)

<img width="1837" height="593" alt="Screenshot 2025-12-03 015703" src="https://github.com/user-attachments/assets/cde34324-7cdd-4b4c-8698-fb734fe4d123" />

<img width="1532" height="583" alt="Screenshot 2025-12-03 015736" src="https://github.com/user-attachments/assets/daa8a01b-5b26-41fc-bc9b-4da4eafa83a4" />

---

## 👀 Overview

Attend Ease combines geo-location fencing, biometric verification, OTP-based authentication, and real-time video calls into a single attendance platform. It is structured with clean architecture principles on the Flutter side and a RESTful Express API with rate-limited, JWT-secured endpoints on the backend.

---

## ⭐ Key Features

### 🧑‍💼 HR / Admin Features
- **Create Company Account** with physical location and geo-radius
- **Add/Remove Employees** and assign unique employee IDs
- **View and Export Attendance Records** as PDF reports
- **Approve/Reject Leave Requests**
- **View Staff Attendance History** with a calendar interface
- **Admin Profile Management**

### 👤 Employee Features
- **OTP-based Login** via phone number (Twilio)
- **Mark Attendance** only within the company geo-radius
- **Biometric Verification** (fingerprint / face) for clock-in and clock-out
- **View Attendance History** and daily logs
- **Request Leaves** with reason, date & duration
- **Video Call** with HR / team via Zego UIKit

---

## 🖥️ Tech Stack

### Frontend:
- **Flutter** – Cross-platform UI (Android / iOS)
- **Provider** – State management
- **GoRouter** – Declarative navigation
- **GetIt** – Dependency injection
- **Dio** – HTTP client
- **Dart** – Programming language

### Backend:
- **Node.js** – API & logic
- **Express.js** – Server framework
- **MongoDB** – NoSQL database
- **JWT** – Authentication tokens
- **Twilio** – OTP via SMS
- **express-rate-limit** – API rate limiting

---

## 📦 Flutter Packages Used

```yaml
# UI & Fonts
cupertino_icons: ^1.0.6
google_fonts: ^6.2.1
wolt_modal_sheet: ^0.7.1
lottie: ^3.1.2
toastification: ^2.0.0
pinput: ^5.0.0
flutter_switch: ^0.3.2
another_carousel_pro: ^1.0.2
table_calendar: ^3.1.2

# Navigation & DI
go_router: ^14.6.3
get_it: ^7.7.0
provider: ^6.1.2

# Networking & Storage
dio: ^5.6.0
shared_preferences: ^2.2.3

# Location
geolocator: ^13.0.0
geocoding: ^3.0.0

# Auth
local_auth: ^2.3.0

# Video Calling
zego_uikit_prebuilt_call: ^4.14.5

# PDF & Printing
pdf: ^3.10.8
printing: ^5.12.0

# Utilities
intl: ^0.19.0
```

---

## 🗂️ Project Structure

### 📁 Flutter (Frontend)

```
lib/
├── core/
│   ├── constants/        # Colors, text styles, spacing, dimensions
│   ├── di/               # GetIt service locator
│   ├── network/          # Dio API service, endpoints, response models
│   ├── providers/        # Base provider
│   ├── router/           # GoRouter configuration
│   ├── storage/          # SharedPreferences wrapper
│   └── utils/            # Validators
├── features/
│   ├── attendance/       # Mark attendance, biometric auth, location service
│   ├── auth/             # Onboarding, OTP auth, home screen
│   ├── communication/    # Video call (Zego)
│   ├── company/          # HR dashboard, staff management, leave approvals
│   ├── employee/         # Employee dashboard, profile, setup
│   └── leave/            # Leave requests, HR leave management
└── shared/
    └── widgets/          # AppCard, PrimaryButton, AppTextField, StatusBadge, SkeletonBox
```

### 📁 Node.js (Backend)

```
server/
├── controllers/          # authController, companyController, employeeController,
│                         # attendanceController, leaveController, locationController, otpController
├── routes/               # authRoute, companyRoutes, employeeRoute,
│                         # attendanceRoutes, leaveRoute, locationRoute, userRoutes
├── middleware/           # JWT auth, request validation
├── models/               # employee, attendance, leave, location, otp, staffReport, staffCount
└── index.js              # Express server entry point
```

---

## 📦 Backend Dependencies (package.json)

```json
{
  "bcryptjs": "^2.4.3",
  "body-parser": "^1.20.2",
  "cors": "^2.8.6",
  "dotenv": "^16.4.5",
  "express": "^4.19.2",
  "express-rate-limit": "^7.4.0",
  "jsonwebtoken": "^9.0.2",
  "mongoose": "^8.5.1",
  "nodemon": "^3.1.4",
  "otp-generator": "^4.0.1",
  "twilio": "^5.2.2"
}
```

---

## 🛠️ Setup & Installation

### 🔧 Prerequisites

- Flutter SDK `>=3.4.0`
- Node.js & npm
- MongoDB

### 🔌 Clone Repository

```bash
git clone https://github.com/yourusername/attend-ease.git
cd attend-ease
```

### 🔙 Backend Setup

```bash
cd server
npm install
# Copy .env.example to .env and fill in values
npm start
```

Required `.env` variables:

```
MONGO_URI=
JWT_SECRET=
TWILIO_ACCOUNT_SID=
TWILIO_AUTH_TOKEN=
TWILIO_PHONE_NUMBER=
```

### 📲 Flutter Setup

```bash
flutter pub get
flutter run
```

---

## 🎮 Usage Guide

### For HR / Admin
- Register → Set company name, location, and allowed geo-radius
- Add employees with name, phone number, and employee ID
- Monitor daily attendance from the HR dashboard
- Approve or reject pending leave requests
- Export attendance reports as PDF

### For Employees
- Login via phone number OTP
- Complete biometric setup on first login
- Mark attendance — only works within the company geo-radius
- View personal attendance calendar and history
- Apply for leave with reason and date range
- Start a video call via the communication tab

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
