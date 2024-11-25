import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getfit/home+each%20pages/Home.dart';
import '../register.dart';

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
  runApp(const PersonalDetailsApp());
}

class PersonalDetailsApp extends StatelessWidget {
  const PersonalDetailsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Step3(),
    );
  }
}

class Step3 extends StatefulWidget {
  @override
  _Step3ScreenState createState() => _Step3ScreenState();
}

class _Step3ScreenState extends State<Step3> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String selectedGender = "Male";

  @override
  void dispose() {
    fullNameController.dispose();
    dobController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  Future<void> saveDataToFirestore() async {
    if (fullNameController.text.isEmpty ||
        dobController.text.isEmpty ||
        heightController.text.isEmpty ||
        weightController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    try {
      // Get the UID of the currently authenticated user
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No authenticated user found!")),
        );
        return;
      }

      String uid = user.uid;

      // Prepare the user data, including the full name
      final userData = {
        "full_name": fullNameController.text,
        "dob": dobController.text,
        "height_cm": int.parse(heightController.text),
        "weight_kg": int.parse(weightController.text),
        "gender": selectedGender,
      };

      // Save the data to Firestore using UID as the document ID
      await FirebaseFirestore.instance
          .collection("User_details")
          .doc(uid)
          .set(userData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Data saved successfully!")),
      );

      // Navigate to another page (e.g., the home page)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: const Text(
                    "Step 3 of 3",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: const Text(
                    "Personal Details",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: const Text(
                    "Let us know about you to speed up the result.\n Get fit with your personal workout plan!",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),

                // Full Name TextField
                const Text(
                  "Full Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                    prefixText: "👤 ",
                    prefixStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    hintText: "Enter your full name",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                // Birthday TextField
                const Text(
                  "Birthday",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: dobController,
                  decoration: const InputDecoration(
                    prefixText: "📅 ",
                    prefixStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    hintText: "Enter your birthday",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                // Height TextField
                const Text(
                  "Height",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "cm ",
                    prefixStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    hintText: "Enter your height",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                // Weight TextField
                const Text(
                  "Weight",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "kg ",
                    prefixStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    hintText: "Enter your weight",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                // Gender Selection
                const Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _buildGenderButton("Male"),
                    const SizedBox(width: 10),
                    _buildGenderButton("Female"),
                  ],
                ),
                const SizedBox(height: 30),

                // Start Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      saveDataToFirestore();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Start",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Indicator Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildIndicator(false),
                    buildIndicator(false),
                    buildIndicator(true),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderButton(String gender) {
    final bool isSelected = selectedGender == gender;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedGender = gender;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.orange),
          ),
          child: Center(
            child: Text(
              gender,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.orange,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: isActive ? 10 : 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.orange : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
