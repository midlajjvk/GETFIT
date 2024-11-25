import 'package:flutter/material.dart';
import 'package:getfit/home+each%20pages/Exercises/triceps.dart';
import 'biceps.dart';
import 'forearms.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Exercises(),
    );
  }
}

class Exercises extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text("Exercises"),
          centerTitle: true,
          backgroundColor: Colors.teal,
          bottom: TabBar(labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Biceps"),
              Tab(text: "Triceps"),
              Tab(text: "Forearms"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BicepsPage(),
            TricepsPage(),
            ForearmsPage(),
          ],
        ),
      ),
    );
  }
}
