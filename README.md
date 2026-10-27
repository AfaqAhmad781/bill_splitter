💰 Split and Tip Calculator

A sleek, intuitive, and fully responsive Flutter application designed to calculate tip amounts and split bills seamlessly among friends or groups. Built from scratch—starting from a custom Figma design to a fully functional, state-managed Flutter app.

📸 Demo & Features

Live Calculations: Real-time updates for Total Bill, Tip Amount, and Per Person Pay as you type.

Flexible Tip Selection: Tap quick preset buttons (10%, 15%, 20%, 25%) or use the interactive slider for custom tip percentages (0%–30%).

Person Counter: Increment/decrement counter to split costs among groups with built-in zero/negative count guardrails.

Dynamic Text Scaling: Auto-scaling numbers using FittedBox to prevent UI layout overflows on large bill amounts.

Keyboard Dismissal: Tap anywhere on the background screen to close the numerical keyboard cleanly.

🎨 Design to Development Workflow

Figma UI/UX Design: Designed the initial screen concept, custom gradient card (#4F75FF to #9A78FA), and color palette.

Static Flutter UI: Constructed the raw layout using Flutter widgets (Scaffold, Column, Row, Container, SliderTheme, TextField).

State Management & Interactivity: Connected TextEditingController and interactive widgets using setState() and computed getters for dynamic mathematical updates.

Layout Constraint Optimization: Solved boundary overflow issues by replacing rigid heights with flexible layouts and scaling helpers.

🛠️ Built With

Flutter - UI Toolkit for cross-platform development

Dart - Programming language

Figma - Interface design tool

🧠 Key Technical Concepts Implemented

Stateful Lifecycle Management: Used StatefulWidget to preserve user inputs across re-renders and cleaned up memory via dispose().

Computed Getters: Clean separation of math logic (_tipAmount, _totalBill, _perPersonPay) calculated dynamically on demand.

Gesture Handling: Used GestureDetector to handle user taps on containers and manage focus scope for keyboard dismissal.

Constraint Handling: Integrated FittedBox to scale text down dynamically on large values, ensuring cross-device UI stability.

🚀 Getting Started

To run this project locally on your machine:

Prerequisites: Make sure you have the Flutter SDK installed.

Clone the repository:

git clone https://github.com/your-username/split-and-tip-calculator.git


Navigate to project directory:

cd split-and-tip-calculator


Get dependencies:

flutter pub get


Run the app:

flutter run


📄 License

This project is open source and available under the MIT License.