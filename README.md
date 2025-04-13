Attend Ease 🚀
Attend Ease is a Flutter application designed to manage an online attendance system for organizations. It streamlines attendance tracking, biometric verification, and leave management for both HR and employees—making attendance both engaging and efficient.

Overview 👀
Attend Ease offers a robust and user-friendly platform for organizations to manage daily attendance and leave applications. With secure location-based attendance marking and biometric verification, your team stays accountable and on time. The system not only tracks attendance but also provides an intuitive leave management module for both HR and employees.

Key Features ⭐
HR Features 🧑‍💼
Company Account Setup:
HR personnel can create a company account, set the company’s physical location, and determine a radius within which attendance can be marked.

Employee Management:
Easily add or remove employees. Each employee is assigned a unique employee ID for seamless login.

Attendance Overview:
View detailed attendance data with calendar and history views.

Daily Summary Submission:
Submit end-of-day reports displaying the total number of employees present.

Employee Features 👤
Location-Based Attendance:
Employees can mark attendance only when they are within the designated company radius.

Biometric Authentication:
Complete biometric verification for accurate in-time and out-time recording.

Historical Data:
Access attendance records with a dedicated history page and visually appealing calendar view.

Leave Management 🌴
Leave Quota:
Each employee is allocated eight leaves per cycle.

Leave Requests:
Employees can request leave by providing details such as title, date, reason, and duration.

Approval Workflow:
HR can approve or reject leave requests, with leave history visible to both HR and employees.

Tech Stack 🖥️
Frontend:

Flutter – For a modern and interactive UI along with client-side logic.

State Management:

Provider: Ensures proper code structure and enhanced state management across the app.

API Integration and Environment Management: Utilizing robust Flutter packages.

Backend:

Node.js – Serves as the backbone for authentication, business logic, and API endpoints.

Database:

MongoDB – Stores attendance records, employee data, and leave information.

Flutter Packages 📦
Attend Ease leverages several Flutter packages to enhance performance and the user experience:

UI & Animation:

cupertino_icons: ^1.0.6

another_carousel_pro: ^1.0.2

wolt_modal_sheet: ^0.7.1

page_transition

lottie: ^3.1.2

flutter_native_splash

flutter_spinkit

skeletonizer: ^1.4.2

table_calendar

Storage & State Management:

shread_reference for local storage management.

Provider for efficient state management.

cached_network_image: ^3.4.1 for caching profile pictures and images.

API and Environment:

flutter_dotenv

image_picker: ^1.1.2

path_provider

http: ^1.2.2

connectivity_plus: ^6.1.1

Local Services:

geolocator: ^8.2.1 for location-based functionality.

Backend Details 🔧
The backend of Attend Ease is built on Node.js, focusing on security and scalability:

File Structure:

.env – For environment variable configurations.

Routes: Definitions for authentication, attendance, leave requests, and more.

Controllers: Houses the business logic for managing API requests.

Middlewares: Implements security measures including JWT-based authentication.

Authentication:
Uses JWT tokens along with packages like bcryptjs for password hashing and jsonwebtoken for token management.

Dependencies:

"bcryptjs": "^2.4.3"

"body-parser": "^1.20.2"

"cloudinary": "^2.5.1"

"cors": "^2.8.5"

"crypto": "^1.0.1"

"dotenv": "^16.4.5"

"express": "^4.19.2"

"http": "^0.0.1-security"

"jsonwebtoken": "^9.0.2"

"mongoose": "^8.5.1"

"multer": "^1.4.5-lts.1"

"nodemon": "^3.1.4"

"otp-generator": "^4.0.1"

"twilio": "^5.2.2"

Project Structure 🗂️
Frontend (Flutter)
helpers:
Utility functions for local storage management and other common tasks.

screens:
UI screens such as login, attendance marking, history, etc.

models:
Data models representing employees, attendance records, and leave requests.

provider:
Contains classes and logic for state management using Provider.

services:
Handles API calls, network requests, and environment configurations.

styling:
Includes themes, color constants, and other style-related assets.

widgets:
Reusable UI components used across different screens.

Backend (Node.js)
Routes:
Endpoint definitions for handling various operations (authentication, attendance, leave management).

Controllers:
Manages the main business logic for API requests.

Middlewares:
Provides security measures, validation, and error handling.

Configuration:
Contains environment and database connection settings.

Installation and Setup ⚙️
Prerequisites
Flutter SDK

Node.js

MongoDB

Setup Instructions
Clone the repository:

bash
Copy
Edit
git clone https://github.com/yourusername/attend-ease.git
cd attend-ease
Backend Setup:

Navigate to the backend directory:

bash
Copy
Edit
cd backend
Install dependencies:

bash
Copy
Edit
npm install
Create a .env file based on the provided .env.example and update the configuration settings.

Start the backend server:

bash
Copy
Edit
npm run dev
Frontend Setup:

Navigate to the Flutter project directory:

bash
Copy
Edit
cd frontend
Install Flutter dependencies:

bash
Copy
Edit
flutter pub get
Run the application:

bash
Copy
Edit
flutter run
Usage 🎯
For HR Users:

Log in with your HR credentials.

Set up or manage company accounts by defining the attendance radius and adding or removing employees.

Monitor attendance using calendar and history views.

Submit daily attendance summaries and manage leave requests.

For Employee Users:

Log in using your unique employee ID.

Ensure you are within the specified company radius to mark attendance.

Complete biometric verification to record your in-time and out-time.

Request leaves and review your attendance history through the calendar view.

Contributing 🤝
We welcome contributions to improve Attend Ease! If you'd like to contribute:

Fork the repository.

Create a new branch for your feature or bug fix.

Commit your changes with clear and descriptive messages.

Submit a pull request detailing your modifications.

Your contributions help make Attend Ease better for everyone!

License 📄
This project is licensed under the MIT License.

Enjoy seamless attendance tracking with Attend Ease! ✨

Feel free to further customize and extend this README as your project evolves.
