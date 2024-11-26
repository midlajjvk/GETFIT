import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getfit/signin.dart';  // Import Login Screen
import 'package:getfit/register.dart';  // Import Registration Screen
import 'home+each pages/Home.dart';  // Import Home Screen
import 'steps/step3.dart';  // Import Step3 Screen
import 'splash.dart';  // Import Splash Screen

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDNJaaWzdGS8MJpyXs6LPenQ5EGbcMxiUg",
      appId: "1:11985537513:android:9f149605269da252b7a378",
      messagingSenderId: "11985537513",
      projectId: "getfit-2e670",
      storageBucket: "getfit-2e670.appspot.com",
    ),
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      getPages: [
        GetPage(name: '/splash', page: () => Splash()), // Splash page route
        GetPage(name: '/logPage', page: () => LogPage()), // Login page route
        GetPage(name: '/register', page: () => RegPage()), // Registration page route
        GetPage(name: '/home', page: () => Home()), // Home page route
        GetPage(name: '/step3', page: () => Step3()), // Step3 page route
      ],
    ),
  );
}
