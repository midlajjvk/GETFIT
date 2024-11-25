import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TricepsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TricepsCard(
              title: 'Kickback',
              videoPath: 'assets/videos/Triceps1.mp4',
              description: 'The Triceps Kickback is  an excellent movement for isolating the triceps'
                  ' and developing the overall strength and definition in the arm.',
            ),
            TricepsCard(
              title: 'Single Arm Tricep Extension',
              videoPath: 'assets/videos/Triceps2.mp4',
              description:
              ' The Single Arm Tricep Extension is an effective isolation exercise '
                  'that targets the triceps, specifically focusing on the long head of the triceps muscle',
            ),
            TricepsCard(
              title: 'Lying Tricep Extension',
              videoPath: 'assets/videos/Triceps3.mp4',
              description:
              ' The Lying Tricep Extension, also known as the Skull Crusher, is a classic exercise '
                  'for isolating the triceps, particularly the long head of the muscle.',
            ),
            TricepsCard(
              title: 'Tate Press',
              videoPath: 'assets/videos/Triceps4.mp4',
              description:
              ' The Tate Press is a unique triceps exercise that targets the triceps, specifically the '
                  'long head and the medial head, while also engaging the chest and shoulders to some extent.',
            ),
          ],
        ),
      ),
    );
  }
}

class TricepsCard extends StatefulWidget {
  final String title;
  final String videoPath;
  final String description;

  TricepsCard({
    required this.title,
    required this.videoPath,
    required this.description,
  });

  @override
  _TricepsCardState createState() => _TricepsCardState();
}

class _TricepsCardState extends State<TricepsCard> {
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
