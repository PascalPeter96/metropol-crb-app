# Metropol Credit Reference Bureau App

A comprehensive Flutter application for managing credit inquiries, loan approvals, and credit score tracking.

## Features

- Credit inquiry management
- Loan approval processing
- Credit score tracking and history
- Real-time notifications
- Secure authentication system

## Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- Firebase account (for backend services)

## Setup and Run Instructions

1. Clone the repository:
   ```bash
   git clone [repository-url]
   cd metropol_mawanda_peter
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Configure Firebase:
   - Create a new Firebase project at https://console.firebase.google.com/
   - Add your app to the Firebase project
   - Download the `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) files
   - Place them in the respective directories:
     - Android: `android/app/google-services.json`
     - iOS: `ios/Runner/GoogleService-Info.plist`

4. Run the app:
   ```bash
   flutter run
   ```

## Default Login Credentials

To access the application, use the following credentials:
- Email: man@gmail.com
- Password: manman

## Tools and Packages Used

### Core Dependencies
- `firebase_core`: Firebase SDK core functionality
- `firebase_auth`: Authentication services
- `cloud_firestore`: Database operations
- `flutter_bloc`: State management
- `dio`: HTTP client
- `get_it`: Dependency injection
- `injectable`: Code generation for dependency injection

### UI Components
- `flutter_svg`: SVG support
- `google_fonts`: Custom fonts
- `cached_network_image`: Efficient image loading
- `shimmer`: Loading animations

### Development Tools
- `flutter_lints`: Code analysis
- `build_runner`: Code generation
- `json_serializable`: JSON serialization
- `mockito`: Testing

## Firebase Setup Guide

1. Create a new project in the Firebase Console
2. Add your app to the project:
   - For Android: Register your app with package name
   - For iOS: Register your app with bundle identifier
3. Enable required Firebase services:
   - Authentication
   - Firestore Database
   - Cloud Storage
   - Cloud Functions
4. Configure security rules in Firestore:
   ```
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       match /{document=**} {
         allow read, write: if request.auth != null;
       }
     }
   }
   ```

## Code Structure

The project follows a clean architecture pattern:

```
lib/
├── features/
│   ├── auth/
│   ├── credit_inquiries/
│   ├── dashboard/
│   ├── loan_approvals/
│   └── notifications/
├── routes/
├── services/
├── theme/
├── utils/
└── widgets/
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, please open an issue in the GitHub repository.
