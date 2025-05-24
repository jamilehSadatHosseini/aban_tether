# Aban Tether App

A Flutter application for user login and cryptocurrency data management, developed as part of a coding challenge. The app follows **Clean Architecture**, adheres to **SOLID principles**, and uses **Bloc/Cubit** for state management.

---

## 📱 Features

- 🔐 Login screen with email & password validation (using Form & Regex)
- 📈 Home screen showing cryptocurrency data (name, symbol, icon, price)
- ⭐ Mark favorite coins
- 👤 Profile screen showing user info and allowing phone number update
- ✅ Input validation, error handling, and responsive UI
- 🌗 Theme management (optional)
- 🔒 Secure token storage (bonus)
- 🧪 Unit & Widget Tests (optional)

---

## 🧱 Architecture

The app is structured according to **Clean Architecture** with 3 primary layers:

- **Presentation Layer**: UI + Bloc/Cubit for state management
- **Domain Layer**: Entities, Use Cases, and Repository Interfaces
- **Data Layer**: API communication using Dio and repository implementations

Helper utilities, constants, and error handling are located under the `core/` directory.

---

## 🛠️ Tech Stack

- Flutter
- Dart
- Bloc / Cubit
- Dio
- GetIt (for dependency injection)
- Flutter Form, Regex
- Secure Storage (optional)
- Equatable, Either, Functional programming practices

---

## 🚀 Getting Started

1. **Clone the repository:**
```bash
git clone https://github.com/jamilehSadatHosseini/aban_tether
cd aban_tether_app
```

2. **Install dependencies:**
```bash
flutter pub get
```

3. **Run the app:**
```bash
flutter run
```

---

## 🧪 Running Tests (Optional)
```bash
flutter test
```

---

## 📂 Project Structure
```
lib/
├── core/
├── data/
├── domain/
├── presentation/
└── main.dart
```

---

## 🧑‍💻 Author

Jamileh Hosseini  
[LinkedIn](https://www.linkedin.com/in/jshosseini) | [GitHube](https://github.com/jamilehSadatHosseini)

---

