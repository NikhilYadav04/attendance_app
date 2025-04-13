# Attend Ease 🚀

**Attend Ease** is a Flutter application designed to manage an online attendance system for organizations. It streamlines attendance tracking, biometric verification, and leave management for both HR and employees—making attendance both engaging and efficient.

---

## 👀 Overview

Attend Ease offers a robust and user-friendly platform for organizations to manage daily attendance and leave applications. With secure location-based attendance marking and biometric verification, your team stays accountable and on time. The system not only tracks attendance but also provides an intuitive leave management module for both HR and employees.

---

## ⭐ Key Features

### 🧑‍💼 HR Features

- **Company Account Setup**  
  HR personnel can create a company account, set the company’s physical location, and determine a radius within which attendance can be marked.

- **Employee Management**  
  Easily add or remove employees. Each employee is assigned a unique employee ID for seamless login.

- **Attendance Overview**  
  View detailed attendance data with calendar and history views.

- **Daily Summary Submission**  
  Submit end-of-day reports displaying the total number of employees present.

---

### 👤 Employee Features

- **Location-Based Attendance**  
  Employees can mark attendance only when they are within the designated company radius.

- **Biometric Authentication**  
  Complete biometric verification for accurate in-time and out-time recording.

- **Historical Data**  
  Access attendance records with a dedicated history page and visually appealing calendar view.

---

### 🌴 Leave Management

- **Leave Quota**  
  Each employee is allocated eight leaves per cycle.

- **Leave Requests**  
  Employees can request leave by providing details such as title, date, reason, and duration.

- **Approval Workflow**  
  HR can approve or reject leave requests, with leave history visible to both HR and employees.

---

## 🖥️ Tech Stack

### Frontend
- **Flutter** – For a modern and interactive UI along with client-side logic.

### State Management
- **Provider** – Ensures proper code structure and enhanced state management across the app.

### API & Environment
- Robust Flutter packages for API integration and environment management.

### Backend
- **Node.js** – Serves as the backbone for authentication, business logic, and API endpoints.

### Database
- **MongoDB** – Stores attendance records, employee data, and leave information.

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
- `shared_preferences`
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

The backend of Attend Ease is built on **Node.js**, focusing on **security** and **scalability**.

### File Structure

- `.env` – For environment variable configurations  
- **Routes** – Definitions for authentication, attendance, leave requests, and more  
- **Controllers** – Houses business logic for managing API requests  
- **Middlewares** – Implements security including JWT-based authentication

### Authentication
- Uses JWT tokens
- Password hashing with `bcryptjs`
- Token management via `jsonwebtoken`

### Dependencies

```json
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
🗂️ Project Structure
Frontend (Flutter)
helpers/ – Utility functions (e.g., local storage)

screens/ – UI screens like login, history, attendance

models/ – Data models for employee, attendance, leaves

provider/ – State management logic

services/ – API, environment config

styling/ – Colors, themes

widgets/ – Reusable components

Backend (Node.js)
Routes/ – API endpoints

Controllers/ – Business logic

Middlewares/ – Authentication, validation

Configuration/ – DB connection & .env setup

⚙️ Installation and Setup
Prerequisites
Flutter SDK

Node.js

MongoDB

Setup Instructions
1. Clone the repository
bash
Copy
Edit
git clone https://github.com/yourusername/attend-ease.git
cd attend-ease
2. Backend Setup
bash
Copy
Edit
cd backend
npm install
# Create a .env file from .env.example
npm run dev
3. Frontend Setup
bash
Copy
Edit
cd frontend
flutter pub get
flutter run
🎯 Usage
For HR Users
Log in with HR credentials

Set up company location and radius

Add or remove employees

View attendance reports and approve leave requests

For Employee Users
Log in with your employee ID

Mark attendance within radius

Biometric verification for clock-in/out

Request and view leave history

🤝 Contributing
We welcome contributions to Attend Ease!

Fork the repository

Create a new branch

Commit changes with clear messages

Submit a pull request

📄 License
This project is licensed under the MIT License.

Enjoy seamless attendance tracking with Attend Ease! ✨
Feel free to further customize and extend this README as your project evolves.

yaml
Copy
Edit

---

You can now copy and paste this markdown into your `README.md` file and GitHub will render it with proper **headings**, **code blocks**, **lists**, etc.

Want me to turn this into a PDF or something you can preview locally too?
