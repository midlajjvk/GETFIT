import 'package:flutter/material.dart';
import 'package:getfit/steps/step2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Step1(),
    );
  }
}

class Step1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal.shade100, Colors.teal.shade300],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Step 1 of 3",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Image.asset(
                  //   '',
                  //   height: 300,
                  // ),
                ],
              ),
              Text(
                "Welcome to GETFIT \n Fitness Application",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Personalized workouts will help you \ngain strength,get in better shape and\n embrace a healthy lifestyle",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Step2()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildIndicator(true),
                  buildIndicator(false),
                  buildIndicator(false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: isActive ? 10 : 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.teal.shade900 : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
