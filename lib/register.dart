import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getfit/home+each%20pages/Home.dart';
import 'package:getfit/signin.dart';
import 'package:getfit/steps/step3.dart';

void main() async {
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
      home: RegPage(),
      routes: {
        '/home': (context) => Home(),
        '/login': (context) => LogPage(),
        'step3': (context) => Step3(),
      },
    );
  }
}

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final GlobalKey<FormState> formkey = GlobalKey();
  bool showpass = true;
  String? name;
  String? email;
  String? password;
  String? cpassword;

  Future<String?> signup(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.teal,
              padding: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // IconButton(
                  //   icon: Icon(Icons.arrow_back, color: Colors.white),
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  Text(
                    'Registration',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50, top: 80),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 70, right: 70),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your email";
                          }
                          final emailRegex = RegExp(
                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                          );
                          if (!emailRegex.hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          email = value;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 70, right: 70),
                      child: TextFormField(
                        obscureText: showpass,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              showpass
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                showpass = !showpass;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a valid password";
                          } else if (value.length < 6) {
                            return "Password must be at least 6 characters long";
                          }
                          password = value;
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 70, right: 70),
                      child: TextFormField(
                        obscureText: showpass,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value != password) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          signup(email: email!, password: password!).then((value) {
                            if (value == null) {
                              Navigator.pushNamed(context, '/step3'
                              );
                            } else {
                              Get.snackbar("Error", value);
                            }
                          });
                        }
                      },
                      child: Text("Register"),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text("Already have an account? Login!"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
