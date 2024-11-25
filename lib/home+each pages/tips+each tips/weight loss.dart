  import 'package:flutter/material.dart';

  void main() {
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WeightLossScreen(
          title: 'How to weight loss?',
        ),
      );
    }
  }

  class WeightLossScreen extends StatelessWidget {
    final String title;

    WeightLossScreen({required this.title});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Tips"),
          centerTitle: true,
          backgroundColor: Colors.teal,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center( // Center the image
                  child: Image.asset(
                    'assets/images/weightloss.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Weight loss",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Losing weight effectively requires a combination of healthy eating, "
                      "regular physical activity, and lifestyle adjustments that promote "
                      "long-term well-being. Start by focusing on a balanced diet that emphasizes whole,"
                      " nutrient-dense foods such as vegetables, fruits, lean proteins, whole grains, "
                      "and healthy fats, while minimizing processed and high-sugar items that add empty calories."
                      " Portion control is key—eating smaller, well-balanced meals can help prevent overeating while"
                      " keeping energy levels stable throughout the day. Hydration is also essential; drinking plenty"
                      " of water not only supports metabolism but can also help control hunger. Pair these dietary changes"
                      " with regular physical activity, aiming for a mix of cardio exercises like walking, jogging, or cycling "
                      "to burn calories, and strength training to build muscle, which boosts your metabolism over time. Beyond "
                      "diet and exercise, prioritize quality sleep, as poor rest can lead to hormonal imbalances that increase "
                      "hunger and cravings. Stress management is equally important; chronic stress can lead to overeating or"
                      " emotional eating, so incorporate relaxation techniques like meditation, yoga, or deep breathing into your"
                      " routine. Finally, set realistic goals and focus on building sustainable habits that work for your lifestyle,"
                      " avoiding quick fixes or overly restrictive diets that are difficult to maintain. By staying consistent and "
                      "patient, you can achieve healthy, lasting weight loss.",
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
