import 'package:flutter/material.dart';
import 'package:getfit/home+each%20pages/Mealplan/FatLoss.dart';
import 'package:getfit/home+each%20pages/Mealplan/General%20Fitness.dart';
import 'MuscleGain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MealPlan(),
    );
  }
}

class MealPlan extends StatelessWidget {
  final List<String> Meal = [
    "Muscle Gain",
    "Fat Loss",
    "General Fitness",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Plan"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: Meal.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(Meal[index]),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => getMealPlanScreen(Meal[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget getMealPlanScreen(String Meal) {
    switch (Meal) {
      case "Muscle Gain":
        return Musclegain();
      case "Fat Loss":
        return FatLoss();
      case "General Fitness":
        return General();
      default:
        return Scaffold(
          appBar: AppBar(
            title: Text("Unknown Tip"),
            backgroundColor: Colors.orange,
          ),
          body: Center(child: Text("Page not available")),
        );
    }
  }
}
