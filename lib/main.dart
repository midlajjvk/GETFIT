import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:getfit/register.dart';
import 'package:getfit/signin.dart';
import 'fireauthhelper.dart';
import 'home+each pages/Home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDNJaaWzdGS8MJpyXs6LPenQ5EGbcMxiUg",
      appId: "1:11985537513:android:9f149605269da252b7a378",
      messagingSenderId: "",
      projectId: "getfit-2e670",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: FirebaseAuth.instance.currentUser != null ? '/home' : '/register',
      routes: {
        '/register': (context) => RegPage(),
        '/login': (context) => LogPage(),
        '/home': (context) => Home(),
      },
    );
  }
}
