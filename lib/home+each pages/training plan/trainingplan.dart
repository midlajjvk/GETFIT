import 'package:flutter/material.dart';

import 'days.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TrainingPlan(),
  ));
}

class TrainingPlan extends StatelessWidget {
  final List<String> days = [
    "Day 1",
    "Day 2",
    "Day 3",
    "Day 4",
    "Day 5",
    "Day 6",
    "Day 7",
  ];

  final List<Widget> pages = [
    Day1(),
    Day2(),
    Day3(),
    Day4(),
    Day5(),
    Day6(),
    Day7(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Training Plan",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: days.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      Colors.teal.shade300,
                      Colors.teal.shade600,
                      Colors.teal.shade900,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    days[index],
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.teal,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => pages[index],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
