import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ForearmsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ForearmsCard(
              title: 'Wrist Roller',
              videoPath: 'assets/videos/Forearms1.mp4',
              description: 'The Wrist Roller is a classic forearm exercise that targets the flexor and extensor'
                  ' muscles of the forearm, improving grip strength and wrist stability.',
            ),
            ForearmsCard(
              title: 'One Arm Reverse Wrist Curl',
              videoPath: 'assets/videos/Forearms2.mp4',
              description:
              ' The One-Arm Reverse Wrist Curl is an isolation exercise that strengthens the forearm extensors, '
                  'the muscles responsible for extending the wrist and fingers',
            ),
            ForearmsCard(
              title: 'One Arm Wrist Curl',
              videoPath: 'assets/videos/Forearms3.mp4',
              description:
              'The One-Arm Wrist Curl is an isolation exercise that targets the forearm flexors,'
                  ' the muscles responsible for bending the wrist.',
            ),
            ForearmsCard(
              title: 'Seated Neutral Wrist Curl',
              videoPath: 'assets/videos/Forearms4.mp4',
              description:
              'The Seated Neutral Wrist Curl is an isolation exercise that targets the forearm muscles, '
                  'specifically the brachioradialis and other wrist flexor muscles.',
            ),
          ],
        ),
      ),
    );
  }
}

class ForearmsCard extends StatefulWidget {
  final String title;
  final String videoPath;
  final String description;

  ForearmsCard({
    required this.title,
    required this.videoPath,
    required this.description,
  });

  @override
  _ForearmsCardState createState() => _ForearmsCardState();
}

class _ForearmsCardState extends State<ForearmsCard> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);  // Make sure it loops (optional)
        _controller.play();  // Explicitly start playing the video
      });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : CircularProgressIndicator(),
          SizedBox(height: 10),
          Text(widget.description, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
