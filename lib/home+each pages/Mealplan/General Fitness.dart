import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: General(),
    );
  }
}

class General extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Plan'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Container(width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal.shade100, Colors.teal.shade300],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/meal3.jpeg',
                  width: 300,
                  height: 300,
                ),
                SizedBox(height: 20),
                Text(
                  'General Fitness/Healthy Eating Meal Plan',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '* Goal: Maintain energy for workouts and support overall health.\n'
                      '* Caloric Focus: Maintenance calories.\n'
                      '* Macronutrient Breakdown: Balanced carbs (40%), protein (30%), and fats (30%).\n'
                      '- Meal Structure:\n'
                      '* Pre-Workout: Balanced meal/snack with protein and carbs.\n'
                      '* Post-Workout: Light protein shake or a small meal with carbs and protein.\n'
                      '* Main Meals: Whole-food-based, including proteins (e.g., fish, eggs), whole grains, vegetables, and healthy fats.\n'
                      '* Snacks: Fresh fruits, nuts, or yogurt.',
                  style: TextStyle(
                    fontSize: 18,

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
