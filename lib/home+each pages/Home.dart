import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:getfit/home+each%20pages/Mealplan/meal%20plan.dart';
import 'Exercises/Exercises.dart';
import 'Settings/settings.dart';
import 'support.dart';
import 'tips+each tips/tips.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDNJaaWzdGS8MJpyXs6LPenQ5EGbcMxiUg",
      appId: "1:11985537513:android:9f149605269da252b7a378",
      messagingSenderId: "",
      projectId: "getfit-2e670",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(), // Main home screen
      routes: {
        '/tips': (context) => Tips(),
        '/support': (context) => Support(),
        '/settings': (context) => SettingsPage(),
        '/exercises': (context) => Exercises(),
        '/mealplan': (context) => MealPlan()
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _userFullName = "Loading...";

  @override
  void initState() {
    super.initState();
    _getUserFullName();
  }

  Future<void> _getUserFullName() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('User_details')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          _userFullName = userDoc['full_name'] ?? 'No Name';
        });
      } else {
        setState(() {
          _userFullName = 'No Name';
        });
      }
    } else {
      setState(() {
        _userFullName = 'No Name';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.teal,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.account_circle, size: 50, color: Colors.white),
                    SizedBox(height: 8),
                    Text(
                      _userFullName, // User's full name
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.restaurant_menu,
                  color: Colors.teal,
                ),
                title: Text('Meal Plan'),
                onTap: () {
                  Navigator.pushNamed(context, '/mealplan');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.lightbulb,
                  color: Colors.teal,
                ),
                title: Text('Tips'),
                onTap: () {
                  Navigator.pushNamed(context, '/tips');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.fitness_center,
                  color: Colors.teal,
                ),
                title: Text('Exercises'),
                onTap: () {
                  Navigator.pushNamed(context, '/exercises');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.teal,
                ),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.support,
                  color: Colors.teal,
                ),
                title: Text('Support'),
                onTap: () {
                  Navigator.pushNamed(context, '/support');
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                              "",
                            ),
                          Positioned(
                            top: 16,
                            left: 16,
                            child: Text(
                              'Welcome to GetFit!',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors
                                    .white, // White color to contrast against the image
                              ),
                            ),
                          ),
                          Positioned(
                            top: 35,
                            left: 16,
                            child: Text(
                              _userFullName,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(16.0),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildGridItem(context, Icons.assignment, 'Training Plan',
                      '/training_plan'),
                  _buildGridItem(
                      context, Icons.restaurant_menu, 'Meal Plan', '/mealplan'),
                  _buildGridItem(
                      context, Icons.fitness_center, 'Exercises', '/exercises'),
                  _buildGridItem(context, Icons.lightbulb, 'Tips', '/tips'),
                  _buildGridItem(
                      context, Icons.settings, 'Settings', '/settings'),
                  _buildGridItem(context, Icons.support, 'Support', '/support'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
      BuildContext context, IconData icon, String title, String routeName) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.teal),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
