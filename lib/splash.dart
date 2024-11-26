import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getfit/signin.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with options
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
        GetPage(name: '/logPage', page: () => LogPage()),
      ],
    ),
  );
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _blurAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _blurAnimation = Tween<double>(begin: 12.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed('/logPage');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splashbg.jpg'),
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: _blurAnimation.value,
                    sigmaY: _blurAnimation.value,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/img_1.png',
                        color: Colors.teal,
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'GETFIT',
                        style: GoogleFonts.exo(
                          fontSize: 40,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
