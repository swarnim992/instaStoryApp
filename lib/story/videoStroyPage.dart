

import 'package:flutter/material.dart';
import 'package:story/story_page_view.dart';
import 'package:video_player/video_player.dart';

class VideoStoryPage extends StatefulWidget {
  final String videoUrl;
  // final ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;
  final Key key;

  VideoStoryPage({required this.videoUrl, required this.key,});

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

    // _controller = VideoPlayerController.asset(widget.videoUrl)
    //   ..initialize().then((value) {
    //     setState(() {
    //       _controller.play();
    //     });
    //     // Listen for video completion and navigate to the next story
    //     _controller.addListener(() {
    //       if (_controller.value.position == _controller.value.duration) {
    //         // Pause the current indicator and move to the next story
    //         widget.indicatorAnimationController.value = IndicatorAnimationCommand.pause;
    //
    //         setState(() {
    //           widget.indicatorAnimationController.value = IndicatorAnimationCommand.resume;
    //
    //         });
    //         // Resume the animation to trigger the next story
    //         Future.delayed(Duration(milliseconds: 200), () {
    //           widget.indicatorAnimationController.value = IndicatorAnimationCommand.resume;
    //         });
    //       }
    //     });
    //   });


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
      child: VideoPlayer(_controller,key: widget.key,),
    )
        : Center(child: CircularProgressIndicator());
  }
}
