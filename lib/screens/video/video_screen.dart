import 'package:flutter/material.dart';
import 'package:match/screens/auth/login/welome_sreen.dart';
import 'package:match/screens/home/home_screen.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String videoPath;

   VideoScreen({super.key, required this.videoPath});
  @override
  _IntroScreenState createState() => _IntroScreenState(videoPath: videoPath);
}

class _IntroScreenState extends State<VideoScreen> {
  final String videoPath;
  late VideoPlayerController _controller;

  _IntroScreenState({required this.videoPath});

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(videoPath)
      ..initialize().then((_) {

        setState(() {}); // Ensure the first frame is shown after the video is initialized
        _controller.play(); // Auto play the video
      
      });
      _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>  HomeScreen()), // Replace with your next screen
          );
        
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
          
          
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller,),
                  )
                : CircularProgressIndicator(),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                _controller.pause();
                // _controller.removeListener(listener);
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(builder: (context) =>  WelcomeScreen()), // Replace with your next screen
                // );
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.15,
                height: MediaQuery.of(context).size.height*0.15,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Center(
                  child: Text(
                    'تخطي',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}