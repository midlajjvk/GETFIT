import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BicepsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: ListView(
            children: [
              BicepsCard(
                title: 'Concentration Curl',
                videoPath: 'assets/videos/Biceps1.mp4',
                description: 'The Concentration Curl is an isolation exercise '
                    'that targets the biceps, specifically the bicep peak.',
              ),
              BicepsCard(
                title: 'Cross Body Hammer Curl',
                videoPath: 'assets/videos/Biceps2.mp4',
                description:
                ' This exercise targets the brachialis muscle, which lies underneath '
                    'the biceps, helping to build overall arm size and strength.',
              ),
              BicepsCard(
                title: 'Inner Biceps Curl',
                videoPath: 'assets/videos/Biceps3.mp4',
                description:
                ' An inner biceps curl is a variation of the traditional bicep curl'
                    ' that targets the inner part of the biceps, as well as the forearms.',
              ),
              BicepsCard(
                title: 'Preacher Curl',
                videoPath: 'assets/videos/Biceps4.mp4',
                description:
                ' The preacher curl is a bicep exercise that isolates '
                    'the muscles of the upper arm, particularly the biceps brachii.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BicepsCard extends StatefulWidget {
  final String title;
  final String videoPath;
  final String description;

  BicepsCard({
    required this.title,
    required this.videoPath,
    required this.description,
  });

  @override
  _BicepsCardState createState() => _BicepsCardState();
}

class _BicepsCardState extends State<BicepsCard> {
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
