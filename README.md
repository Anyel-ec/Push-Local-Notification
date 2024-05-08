# Firebase Push Notifications Project in Flutter

This project is designed to implement push notifications using Firebase Cloud Messaging (FCM) in a Flutter application. It provides functionalities to receive notifications both when the app is open and when it's closed.


## **Select Language:**
- [Español (Spanish)](README-es.md)
- [English](README.md)

## Result
### Firebase Notification
![Alt text](docs/fireabase.PNG) 
### Notification
![Alt text](docs/notification.png) 
### Home Screen
![Alt text](docs/home.png) 
### Details Screen
![Alt text](docs/details.png) 


## Dependencies

Below are the main dependencies used in this project:

- **equatable**: ^2.0.5
- **firebase_core**: ^2.30.1
- **firebase_messaging**: ^14.9.1
- **flutter**: sdk: flutter
- **flutter_bloc**: ^8.1.5
- **go_router**: ^14.0.1

## Setup

1. Make sure you have all the mentioned dependencies installed in your Flutter project.
2. Set up your project in Firebase and download the `google-services.json` file. Make sure it's placed correctly in the `android/app` folder of your project.
3. Modify the `firebase_options.dart` file with your Firebase configuration options.
4. Ensure you have correctly imported all necessary files and configured the routes in `app_router.dart`.

## Implementation

The project consists of several key parts:

- **main.dart**: This file is the entry point of the application. Firebase is initialized here, and `FirebaseMessaging.onBackgroundMessage` is configured to handle notifications in the background.
- **notifications_bloc.dart**: This file defines the `NotificationsBloc`, which manages the state of notifications and handles notification-related events.
- **home_screen.dart**: The main screen of the application, displaying the list of received notifications and providing options to configure notifications.
- **details_screen.dart**: A screen to view the details of a specific notification.

## Usage

1. Run the application on a device or emulator compatible with Flutter.
2. The main screen will display the received notifications.
3. You can tap on a notification to view more details.
4. Use the settings icon on the navigation bar to adjust the notification settings.

---

With these steps, you should be able to start developing your push notifications app in Flutter using Firebase! If you have any questions or need further assistance, feel free to ask.