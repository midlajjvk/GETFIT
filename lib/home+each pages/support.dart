import 'package:flutter/material.dart';
import 'Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Support(),
    );
  }
}

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _complaintController = TextEditingController();

  void _sendSupportRequest() {
    if (_formKey.currentState!.validate()) {
      // Perform logic to send support request
      print("Email: ${_emailController.text}");
      print("Complaint: ${_complaintController.text}");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Your request has been sent successfully!')),
      );

      // Clear fields after submission
      _emailController.clear();
      _complaintController.clear();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _complaintController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Support',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "What do you need from us?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50), // Space between the top and text fields
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16), // Space between text fields
                TextFormField(
                  controller: _complaintController,
                  decoration: InputDecoration(
                    labelText: 'Enter your problem',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 70, horizontal: 12),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please describe your problem';
                    }
                    return null;
                  },
                ),
                Spacer(), // Push the button to the bottom
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: _sendSupportRequest,
                    child: Text(
                      'Send',
                      style: TextStyle(fontSize: 16,color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
