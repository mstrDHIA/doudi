import 'package:flutter/material.dart';
import 'package:doudi/controllers/auth_controller.dart';
import 'package:doudi/screens/auth/login/welcome_sreen.dart';
import 'package:doudi/screens/numbers/numbers_menu.dart';
import 'package:pod_player/pod_player.dart';
import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  // late VideoPlayerController _controller;
  late final PodPlayerController controller;

  @override
  void initState() {
     controller = PodPlayerController(
      podPlayerConfig: const PodPlayerConfig(
        forcedVideoFocus: true,
        autoPlay: true,
        
      ),
      playVideoFrom: PlayVideoFrom.asset(
        'assets/videos/intro.mp4',
      ),
    )..initialise();
    controller.addListener(() {
      if (controller.currentVideoPosition == controller.totalVideoLength) {
        // controller.videoState.
        if(Provider.of<AuthController>(context,listen: false).isAuth){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>  const NumbersMenuScreen()), // Replace with your next screen
          );
        }
        else{
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>  const WelcomeScreen()), // Replace with your next screen
          );
        }
        
        
      }
    });
    super.initState();
    // _controller = VideoPlayerController.asset('assets/videos/intro.mp4',)
    //   ..initialize().then((_) {

    //     setState(() {}); // Ensure the first frame is shown after the video is initialized
    //     _controller.play(); // Auto play the video
      
    //   });
    //   _controller.addListener(() {
    //   if (_controller.value.position == _controller.value.duration) {
    //     Navigator.of(context).pushReplacement(
    //         MaterialPageRoute(builder: (context) =>  WelcomeScreen()), // Replace with your next screen
    //       );
        
    //   }
    // });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
           child: PodVideoPlayer(controller: controller),
            // child: _controller.value.isInitialized
            //     ? AspectRatio(
          
          
            //         aspectRatio: _controller.value.aspectRatio,
            //         child: VideoPlayer(_controller,),
            //       )
            //     : CircularProgressIndicator(),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
              
        
                controller.pause();
                // controller.removeListener();
                if(Provider.of<AuthController>(context,listen: false).isAuth){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>  const NumbersMenuScreen()), // Replace with your next screen
          );
        }
        else{
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>  const WelcomeScreen()), // Replace with your next screen
          );
        }
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.15,
                height: MediaQuery.of(context).size.height*0.15,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: const Center(
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