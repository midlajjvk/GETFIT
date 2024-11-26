import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:getfit/home+each%20pages/Mealplan/meal%20plan.dart';
import 'package:getfit/home+each%20pages/training%20plan/trainingplan.dart';
import 'package:getfit/signin.dart';
import 'package:google_fonts/google_fonts.dart';
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
        '/trainingplan': (context) => TrainingPlan(),
        '/tips': (context) => Tips(),
        '/support': (context) => Support(),
        '/settings': (context) => SettingsPage(),
        '/exercises': (context) => Exercises(),
        '/mealplan': (context) => MealPlan(),
        '/login': (context) => LogPage()
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
          title: Text(
            "Welcome To GetFit!",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
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
                  Icons.assignment,
                  color: Colors.teal,
                ),
                title: Text('Training Plan'),
                onTap: () {
                  // Navigator.pushNamed(context, '/trainingplan');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrainingPlan()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.restaurant_menu,
                  color: Colors.teal,
                ),
                title: Text('Meal Plan'),
                onTap: () {
                  // Navigator.pushNamed(context, '/mealplan');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MealPlan()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.lightbulb,
                  color: Colors.teal,
                ),
                title: Text('Tips'),
                onTap: () {
                  // Navigator.pushNamed(context, '/tips');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tips()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.fitness_center,
                  color: Colors.teal,
                ),
                title: Text('Exercises'),
                onTap: () {
                  // Navigator.pushNamed(context, '/exercises');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercises()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.teal,
                ),
                title: Text('Settings'),
                onTap: () {
                  // Navigator.pushNamed(context, '/settings');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.support,
                  color: Colors.teal,
                ),
                title: Text('Support'),
                onTap: () {
                  // Navigator.pushNamed(context, '/support');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Support()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.teal,
                ),
                title: Text('Logout'),
                onTap: () {
                  // Navigator.pushNamed(context, '/login');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Container( width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal.shade50, Colors.teal.shade50],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/images/fit.jpeg"),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _userFullName,
                            style: GoogleFonts.josefinSlab(
                              fontSize: 30, // Adjust font size as needed
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8), // Add spacing between the username and the text
                          Text(
                            "Your journey to a healthier, stronger, and more\n"
                                "confident you starts here. Let’s crush those fitness\n"
                                "goals together!",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
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
                    _buildGridItem(
                      context,
                      Icons.assignment,
                      'Training Plan',
                      TrainingPlan(),
                      LinearGradient(
                        colors: [Colors.teal.shade400, Colors.teal.shade800],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    _buildGridItem(
                      context,
                      Icons.restaurant_menu,
                      'Meal Plan',
                      MealPlan(),
                      tealGradient,
                    ),
                    _buildGridItem(
                      context,
                      Icons.fitness_center,
                      'Exercises',
                      Exercises(),
                      tealGradient,
                    ),
                    _buildGridItem(
                      context,
                      Icons.lightbulb,
                      'Tips',
                      Tips(),
                      tealGradient,
                    ),
                    _buildGridItem(
                      context,
                      Icons.settings,
                      'Settings',
                      SettingsPage(),
                      tealGradient,
                    ),
                    _buildGridItem(
                      context,
                      Icons.support,
                      'Support',
                      Support(),
                      tealGradient,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LinearGradient tealGradient = LinearGradient(
    colors: [Colors.teal.shade300, Colors.teal.shade800],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  Widget _buildGridItem(BuildContext context, IconData icon, String title,
      Widget nextPage, Gradient gradient) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => nextPage, // Pass the destination widget
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
