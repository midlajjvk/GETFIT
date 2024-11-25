  import 'package:flutter/material.dart';
  import 'package:getfit/home+each%20pages/Home.dart';

  import 'selectlanguage.dart';

  void main() {
    runApp(const SettingsApp());
  }

  class SettingsApp extends StatelessWidget {
    const SettingsApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: SettingsPage(),
      );
    }
  }

  class SettingsPage extends StatefulWidget {
    @override
    _SettingsPageScreenState createState() => _SettingsPageScreenState();
  }

  class _SettingsPageScreenState extends State<SettingsPage> {
    bool isGPSOn = false;
    bool isAutoPauseOn = false;
    bool isPauseForCallsOn = false;
    bool isVoiceVolumeOn = true;
    double voiceVolume = 0.5;

    double selectedTime = 25;
    double selectedDistance = 10;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text("Settings"),
          leading: IconButton(onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));  }, icon: Icon( Icons.arrow_back,)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SwitchListTile(
                title: const Text("GPS"),
                value: isGPSOn,
                onChanged: (bool value) {
                  setState(() {
                    isGPSOn = value;
                  });
                },
              ),

              SwitchListTile(
                title: const Text("Auto Pause"),
                value: isAutoPauseOn,
                onChanged: (bool value) {
                  setState(() {
                    isAutoPauseOn = value;
                  });
                },
              ),

              SwitchListTile(
                title: const Text("Pause run for calls"),
                value: isPauseForCallsOn,
                onChanged: (bool value) {
                  setState(() {
                    isPauseForCallsOn = value;
                  });
                },
              ),

              SwitchListTile(
                title: const Text("Voice Volume"),
                value: isVoiceVolumeOn,
                onChanged: (bool value) {
                  setState(() {
                    isVoiceVolumeOn = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              const Text(
                "Audio Feedback",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Slider(
                value: voiceVolume,
                onChanged: isVoiceVolumeOn
                    ? (double value) {
                        setState(() {
                          voiceVolume = value;
                        });
                      }
                    : null,
                min: 0,
                max: 1,
                divisions: 10,
                activeColor: Colors.teal,
                inactiveColor: Colors.grey.shade300,
              ),
              const SizedBox(height: 20),
              _buildSliderWithLabel(
                "Time",
                selectedTime,
                1,
                60,
                (value) {
                  setState(() {
                    selectedTime = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildSliderWithLabel(
                "Distance",
                selectedDistance,
                1,
                60,
                (value) {
                  setState(() {
                    selectedDistance = value;
                  });
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LanguageScreen()));
                },
                child: Text(
                  "⚫ Select Language",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _buildSliderWithLabel(String label, double currentValue, double min,
        double max, ValueChanged<double> onChanged) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ${currentValue.toStringAsFixed(0)}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(min.toStringAsFixed(0)),
              Expanded(
                child: Slider(
                  value: currentValue,
                  onChanged: onChanged,
                  min: min,
                  max: max,
                  divisions: (max - min).toInt(),
                  activeColor: Colors.teal,
                  inactiveColor: Colors.grey.shade300,
                ),
              ),
              Text(max.toStringAsFixed(0)),
            ],
          ),
        ],
      );
    }
  }
