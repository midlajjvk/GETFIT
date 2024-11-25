import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FatLoss(),
    );
  }
}

class FatLoss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Plan'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/meal2.jpeg',
                width: 300,
                height: 300,
              ),
              SizedBox(height: 20),
              Text(
                'Fat Loss/Cutting Meal Plan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '* Goal: Reduce body fat while preserving muscle mass.\n'
                '* Caloric Focus: Calorie deficit (10-20% below maintenance level).\n'
                '* Macronutrient Breakdown: High protein (40%), moderate carbs (30%), low fats (20-30%).\n'
                '- Meal Structure:\n'
                '* Pre-Workout: Small meal with lean protein (e.g., turkey slices) and a small portion of carbs (e.g., half an apple).\n'
                '* Post-Workout: Protein shake with minimal carbs.\n'
                '* Main Meals: Focus on portion control with lean protein (e.g., grilled chicken), vegetables, and a small amount of healthy fats.\n'
                '* Snacks: Low-calorie, high-protein snacks like edamame, cottage cheese, or nuts in moderation.',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
