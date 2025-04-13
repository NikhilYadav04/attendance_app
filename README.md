# Attend Ease 🚀

**Attend Ease** is a Flutter application designed to manage an online attendance system for organizations. It streamlines attendance tracking, biometric verification, and leave management for both HR and employees—making attendance both engaging and efficient.

---

## 👀 Overview

Attend Ease offers a robust and user-friendly platform for organizations to manage daily attendance and leave applications. With secure location-based attendance marking and biometric verification, your team stays accountable and on time. The system not only tracks attendance but also provides an intuitive leave management module for both HR and employees.

---

## ⭐ Key Features

### 🧑‍💼 HR Features

- **Company Account Setup:**  
  HR personnel can create a company account, set the company’s physical location, and determine a radius within which attendance can be marked.

- **Employee Management:**  
  Easily add or remove employees. Each employee is assigned a unique employee ID for seamless login.

- **Attendance Overview:**  
  View detailed attendance data with calendar and history views.

- **Daily Summary Submission:**  
  Submit end-of-day reports displaying the total number of employees present.

---

### 👤 Employee Features

- **Location-Based Attendance:**  
  Employees can mark attendance only when they are within the designated company radius.

- **Biometric Authentication:**  
  Complete biometric verification for accurate in-time and out-time recording.

- **Historical Data:**  
  Access attendance records with a dedicated history page and calendar view.

---

### 🌴 Leave Management

- **Leave Quota:**  
  Each employee is allocated eight leaves per cycle.

- **Leave Requests:**  
  Employees can request leave by providing details such as title, date, reason, and duration.

- **Approval Workflow:**  
  HR can approve or reject leave requests, with leave history visible to both HR and employees.

---

## 🖥️ Tech Stack

### Frontend

- **Flutter** – For a modern and interactive UI.
- **Provider** – For state management.

### Backend

- **Node.js** – Authentication and business logic.
- **MongoDB** – For storing data.

---

## 📦 Flutter Packages

### UI & Animation

- `cupertino_icons: ^1.0.6`
- `another_carousel_pro: ^1.0.2`
- `wolt_modal_sheet: ^0.7.1`
- `page_transition`
- `lottie: ^3.1.2`
- `flutter_native_splash`
- `flutter_spinkit`
- `skeletonizer: ^1.4.2`
- `table_calendar`

### Storage & State Management

- `shread_reference`
- `provider`
- `cached_network_image: ^3.4.1`

### API & Environment

- `flutter_dotenv`
- `image_picker: ^1.1.2`
- `path_provider`
- `http: ^1.2.2`
- `connectivity_plus: ^6.1.1`

### Local Services

- `geolocator: ^8.2.1`

---

## 🔧 Backend Details

### Structure

- `.env` – Configuration for environment variables.
- **Routes** – Authentication, attendance, and leave endpoints.
- **Controllers** – API logic.
- **Middlewares** – JWT security, validation, error handling.

### Authentication

- JWT tokens
- `bcryptjs` for password hashing
- `jsonwebtoken` for token management

### Dependencies

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

🗂️ Project Structure
Frontend (Flutter)

lib/
│
├── helpers/        # Utility functions
├── screens/        # Login, attendance, history, etc.
├── models/         # Data models
├── provider/       # State management logic
├── services/       # API & env configuration
├── styling/        # Themes, colors
└── widgets/        # Reusable UI components

Backend (Node.js)

backend/
│
├── routes/         # Endpoints
├── controllers/    # Logic for requests
├── middlewares/    # Auth and validation
└── config/         # DB & env setup

⚙️ Installation and Setup
Prerequisites
Flutter SDK

Node.js

MongoDB

Clone the repository
git clone https://github.com/yourusername/attend-ease.git
cd attend-ease

Backend Setup
cd backend
npm install
# Create a .env file based on .env.example and add your values
npm run dev

Frontend Setup
cd frontend
flutter pub get
flutter run

🎯 Usage
HR Users
Log in with HR credentials.

Manage company account, define attendance radius, and manage employees.

View attendance in calendar/history.

Submit daily summaries and handle leave requests.

Employee Users
Log in using employee ID.

Mark attendance only within allowed radius.

Biometric verification for time tracking.

Request leaves and view history.

🤝 Contributing
We welcome contributions!

Fork the repo

Create a new branch

Make changes and commit

Submit a pull request

📄 License
Licensed under the MIT License.

Enjoy seamless attendance tracking with Attend Ease! ✨
