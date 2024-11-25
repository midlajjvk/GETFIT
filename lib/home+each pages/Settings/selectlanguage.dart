import 'package:flutter/material.dart';
import 'package:getfit/home+each%20pages/Settings/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LanguageScreen(),
    );
  }
}

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    List<String> languages = [
      "English",
      "Spanish",
      "Hindi",
      "Arabic",
      "Portuguese",
      "Bengali",
      "Russian",
      "Vietnamese"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Language"),centerTitle: true,
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
          },
        ),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          String language = languages[index];
          return ListTile(
            title: Text(language),
            trailing: selectedLanguage == language
                ? Icon(Icons.check, color: Colors.teal)
                : null,
            onTap: () {
              // Update the selected language and re-render the list
              setState(() {
                selectedLanguage = language;
              });
            },
          );
        },
      ),
    );
  }
}
