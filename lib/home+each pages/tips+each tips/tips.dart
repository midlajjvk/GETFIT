import 'package:flutter/material.dart';
import 'package:getfit/home+each%20pages/tips+each%20tips/meal%20plan.dart';
import 'package:getfit/home+each%20pages/tips+each%20tips/weight%20loss.dart';

import 'about training screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tips(),
    );
  }
}

class Tips extends StatelessWidget {
  final List<String> tips = [
    "About training",
    "How to weight loss?",
    "Introducing about meal plan",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tips"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tips[index]),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal),
            onTap: () {
              // Navigate to the corresponding screen based on the tip
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => getTipDetailScreen(tips[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget getTipDetailScreen(String tip) {
    switch (tip) {
      case "About training":
        return AboutTrainingScreen(
          title: '',
        );
      case "How to weight loss?":
        return WeightLossScreen(
          title: '',
        );
      case "Introducing about meal plan":
        return MealplanTip(title: '');
      // case "Water and Food":
      //   return WaterFoodScreen();
      // case "Drink water":
      //   return DrinkWaterScreen();
      // case "How many times a day to eat":
      //   return EatingFrequencyScreen();
      // case "Become stronger":
      //   return BecomeStrongerScreen();
      // case "Shoes To Training":
      //   return ShoesTrainingScreen();
      // case "Appeal Tips":
      //   return AppealTipsScreen();
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
