

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoStoryPage extends StatefulWidget {
  final String videoUrl;

  VideoStoryPage({required this.videoUrl});

  @override
  _VideoStoryPageState createState() => _VideoStoryPageState();
}

class _VideoStoryPageState extends State<VideoStoryPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(widget.videoUrl)
    //   ..initialize().then((_) {
    //     setState(() {});
    //     _controller.play(); // Automatically play the video when initialized
    //   });
    // _controller = VideoPlayerController.asset(widget.videoUrl)
    //   ..initialize().then((_) {
    //     setState(() {});
    //     _controller.play(); // Automatically play the video when initialized
    //   });

    // _controller = VideoPlayerController.asset('assets/videos/1.mp4')
    //   ..initialize().then((_) {
    //     setState(() {});
    //     _controller.play();
    //   });

    // _controller = VideoPlayerController.network(widget.videoUrl)
    //   ..initialize().then((_) {
    //     setState(() {});
    //     _controller.play();
    //   }).catchError((error) {
    //     // Handle the error here, e.g., show a message to the user
    //     print("Video Player Error: $error");
    //   });

    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    )
        : Center(child: CircularProgressIndicator());
  }
}
