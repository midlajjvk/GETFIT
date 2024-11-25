import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AboutTrainingScreen(
        title: 'About Training',
      ),
    );
  }
}

class AboutTrainingScreen extends StatelessWidget {
  final String title;

  AboutTrainingScreen({required this.title});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/workout.jpg',
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              "Drink water",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              "Drinking water is essential for maintaining optimal performance"
                  " during your workouts. Proper hydration helps regulate body"
                  " temperature, lubricate joints, and deliver nutrients to muscles,"
                  " ensuring they function efficiently. Dehydration can lead to fatigue,"
                  " dizziness, and reduced endurance, making it harder to achieve your"
                  " fitness goals. Aim to drink water consistently throughout the day,"
                  " not just during exercise. For intense or prolonged workouts, consider"
                  " sipping water every 15-20 minutes to replenish fluids lost through sweat."
                  " Staying hydrated boosts recovery, keeps you energized, and enhances"
                  " overall workout effectiveness. Remember, water is your workout's best "
                  "companion!",
              style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
            ),
            SizedBox(height: 16.0),
            Text(
              "Calories",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              "Calories are the fuel your body needs for energy, "
                  "but balancing them is key to achieving your fitness goals."
                  " If you're working out to build muscle, focus on a slight calorie "
                  "surplus by eating nutrient-dense foods like lean proteins, whole grains,"
                  " and healthy fats. For weight loss, create a calorie deficit by consuming "
                  "fewer calories than you burn while ensuring your diet is rich in vitamins "
                  "and minerals. Avoid empty-calorie foods like sugary snacks and sodas, which"
                  " can hinder progress. Remember, quality matters just as much as "
                  "quantity—choose whole, unprocessed foods to keep"
                  " your energy levels stable and your body performing at its best!",
              style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
