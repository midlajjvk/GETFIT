import 'package:flutter/material.dart';
import 'package:getfit/register.dart';
import 'package:getfit/steps/step3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Step2(),
    );
  }
}

class Step2 extends StatefulWidget {
  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  String _selectedLevel = 'Beginner';
  final List<String> _levels = ['Beginner', 'Intermediate', 'Advanced'];

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
                    "Step 2 of 3",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Select your fitness level",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _levels.map((level) {
                    return RadioListTile<String>(
                      title: Text(level),
                      value: level,
                      groupValue: _selectedLevel,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedLevel = value!;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegPage()));
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildIndicator(false),
                  buildIndicator(true),
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
