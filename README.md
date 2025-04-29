


# 📚 Education App

A Flutter application for accessing and learning various courses, with quizzes and progress tracking features. Built using the MVVM architecture.

---

## 📦 Features

- 🧑‍🎓 Google Sign-In authentication
- 📚 Explore popular and detailed course content
- 📝 Quiz and exam functionality for each course
- 🛎️ Notifications via OneSignal
- 💳 Integrated payment system using Paymob
- 🧠 MVVM architecture with organized layers (data, cubit, widget)

---

## 📁 Project Structure

```
lib/
├── core/
│   ├── app, constants, error, extensions, function, get_it...
├── Feature/
│   ├── Login/ (cubit, data, widget, screen_login.dart)
│   ├── home/, courses/, main/, notification/
├── main.dart
```

---

## 📸 Screenshots

### 🔐 Sign Up
<img src="https://github.com/user-attachments/assets/fd499d3b-0276-4d30-9d45-fc0a2866c52c" width="300">

### 🔓 Login
<img src="https://github.com/user-attachments/assets/45b51e56-124e-4534-b4c4-7591261150a1" width="300">

### 📝 Exams Question
<img src="https://github.com/user-attachments/assets/50ab317c-3e04-45bf-b82b-9341b5e17614" width="300">

### 🌟 Popular Courses
<img src="https://github.com/user-attachments/assets/305cbf97-313a-489c-b550-5d7a02eb000d" width="300">

### 📖 Course Details
<img src="https://github.com/user-attachments/assets/07d8ecf1-0ab4-439e-8cbe-dde2c4757a8f" width="300">

### 📘 Introduction Exams
<img src="https://github.com/user-attachments/assets/4633b884-e277-4344-ab6e-49ae00f82014" width="300">

### 🔄 Loading Screen
<img src="https://github.com/user-attachments/assets/3b21a576-7e85-4cd5-988b-8726aefcca1b" width="300">

### 🏠 Home
<img src="https://github.com/user-attachments/assets/92c0cbe9-7a7a-4c6f-953e-f872066ce7e5" width="300">

### 🧑‍🏫 Mentor Screen
<img src="https://github.com/user-attachments/assets/e7e7ba5f-463c-4604-9dbf-eaaea8e62526" width="300">

---

## 🛠️ Requirements

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Supabase](https://supabase.com/) - Realtime database & backend
- [Google Sign-In](https://pub.dev/packages/google_sign_in)
- [OneSignal](https://onesignal.com/) - Push Notifications
- [Paymob](https://paymob.com/) - Online Payments

---

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/education_app.git
   cd education_app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure Supabase**

   - Create a new project on Supabase.
   - Copy your Supabase URL and API key.
   - Create a `.env` file in the project root with:
     ```env
     SUPABASE_URL=https://your-project.supabase.co
     SUPABASE_API_KEY=your_api_key
     ```

4. **Run the app**

   ```bash
   flutter run
   ```

---
## 📄 License

This project is licensed under the MIT License.


