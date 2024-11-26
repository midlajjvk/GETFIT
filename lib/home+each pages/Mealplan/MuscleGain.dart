import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Musclegain(),
    );
  }
}

class Musclegain extends StatelessWidget {
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
                  'assets/images/meal1.jpeg',
                  width: 300,
                  height: 300,
                ),
                SizedBox(height: 20),
                Text(
                  'Muscle Gain/Bodybuilding Meal Plan',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '* Goal: Build lean muscle mass and strength.\n*Caloric Focus: Calorie surplus (10-20% above maintenance level).'
                  '\n* Macronutrient Breakdown: High protein (30-40%), moderate carbs (30-40%), moderate fats (20-30%).\n'
                  '- Meal Structure:\n* Pre-Workout: Moderate carbs (e.g., oatmeal) and lean protein (e.g., chicken breast or eggs) 2-3 hours before.'
                  '\n* Post-Workout: Fast-digesting protein (e.g., whey protein shake) and high-GI carbs (e.g., banana) within 30-60 minutes.'
                  '\n* Main Meals: Balanced with lean protein (chicken, fish, tofu), complex carbs (brown rice, sweet potatoes), and healthy fats (avocado, nuts).'
                  '\n* Snacks: Protein bars, Greek yogurt, or boiled eggs.',
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
