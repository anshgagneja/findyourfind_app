# 🛍️ FindYourFind – Flutter E-Commerce App

**FindYourFind** is a cross-platform mobile application built using **Flutter**, designed to work seamlessly with the [FindYourFind Web Platform](https://github.com/anshgagneja/findyourfind_web). It delivers a complete mobile shopping experience for customers with real-time backend connectivity, product management, and order tracking.

---

## 📦 Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Screenshots](#screenshots)
- [Setup Instructions](#setup-instructions)
- [Backend Integration](#backend-integration)
- [Future Scope](#future-scope)
- [Author](#author)

---

## 📱 Introduction

This Flutter-based mobile app is the customer-facing companion to the FindYourFind e-commerce system. It connects to the PHP + MySQL backend, allowing users to browse products, manage carts and wishlists, place orders, and view past purchases.

---

## 🚀 Features

- **User Authentication**
  - Login / Sign Up / OTP Verification / Forgot Password
- **Product Browsing**
  - Home screen with dynamic product listings
  - Product detail view
- **Cart & Order Management**
  - Add/remove products from cart
  - Swipe-to-delete cart items
  - Place orders with quantity selection
  - View order history
- **User Profile**
  - View and edit profile
  - Persistent login state
- **Navigation**
  - Bottom navigation bar for quick access to key sections

---

## 🛠️ Technologies Used

- **Flutter** for cross-platform app development
- **Dart** as the programming language
- **REST API** integration with PHP + MySQL backend
- **Material Design** for UI/UX consistency
- **State Management:** `setState` / `Provider` (based on your choice)

---

## 🖼️ Screenshots

| Onboarding | Login |
|-----------|-------|
| (![WhatsApp Image 2025-06-05 at 09 25 12_775240ca](https://github.com/user-attachments/assets/172f71a3-93ec-48a1-8f6d-0725a0eb3268)
) |![WhatsApp Image 2025-06-05 at 09 25 12_67a4653b](https://github.com/user-attachments/assets/21d5448e-813b-4637-8867-1b37b1d62483)
|

| Sign Up | Product Grid |
|--------|---------------|
| ![WhatsApp Image 2025-06-05 at 09 25 12_b0298968](https://github.com/user-attachments/assets/7c52732e-82d6-4483-a133-cecc23634906)
| ![WhatsApp Image 2025-06-05 at 09 23 22_c10ada2f](https://github.com/user-attachments/assets/871aff33-290e-492b-8fa5-640308e541a6)
|

| Cart | Wishlist | Order History |
|------|----------|----------------|
| ![WhatsApp Image 2025-06-05 at 09 23 51_93283b3f](https://github.com/user-attachments/assets/7bb03015-3cc4-49d8-bd7c-7d5a8ebf0b09)
| ![WhatsApp Image 2025-06-05 at 09 24 16_987214a4](https://github.com/user-attachments/assets/bf28b9eb-7f30-4f94-bfc1-bf3e53e5b330)
| ![WhatsApp Image 2025-06-05 at 09 24 31_861a3613](https://github.com/user-attachments/assets/93a8fa2f-f91f-418f-9072-ce5764ffbda3)
|



---

## ⚙️ Setup Instructions

1. **Clone the repository**
2. Run `flutter pub get` to fetch dependencies
3. Ensure your backend is running from [findyourfind_web](https://github.com/anshgagneja/findyourfind_web)
4. Update base URLs in API service files (if needed)
5. Launch using `flutter run`

---

## 🔗 Backend Integration

- This app connects to the backend API hosted in:
  👉 [FindYourFind Web Backend](https://github.com/anshgagneja/findyourfind_web)
- Built with PHP and MySQL, the backend supports:
  - Product listings
  - Cart and order management
  - User authentication
  - Wishlist handling
  - Role-based access (admin/customer)

---

## 🔮 Future Scope

- Payment gateway integration (e.g., Razorpay, Stripe)
- Push notifications
- Enhanced product filtering and search
- Dark mode and accessibility improvements

---

## 👨‍💻 Author

Developed by **Ansh Gagneja**  
🔗 [GitHub](https://github.com/anshgagneja)

---



