// import 'package:doudi/next.dart';
import 'package:doudi/controllers/auth_controller.dart';
import 'package:doudi/controllers/progress_controller.dart';
import 'package:doudi/screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AuthController authController;
  bool firstTime = true;
  late ProgressController progressController;


  

  @override
  void initState() {
    super.initState();
    authController=Provider.of<AuthController>(context, listen: false);
    progressController=Provider.of<ProgressController>(context, listen: false);
    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define the animation to expand the image
    _animation = Tween<double>(begin: 1, end: 3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animation
    _controller.forward();
    
    // Navigate to the next screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>IntroScreen())); // Replace '/home' with your target route
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  didChangeLogic(ctx) async {
    progressController.getCurrentNumber();
    SharedPreferences prefs=await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 2), () async {
          // ignore: use_build_context_synchronously
          // if
          String? deviceId =
          await MobileDeviceIdentifier().getDeviceId();
          deviceId = deviceId!.replaceAll(":", "");
          prefs.getBool('isAuth')!?authController.login(deviceId, '12345', ctx):
          Navigator.of(ctx).pushReplacement(
            MaterialPageRoute(builder: (context) =>  const IntroScreen()), // Replace with your next screen
          );
        });
        if((prefs.containsKey('isFirst'))&&(prefs.getBool('isFirst')==true)){
      prefs.setInt('currentLevel', 1);
    }
    prefs.setBool('isFirst', false);
    if(prefs.containsKey('isAuth')==false){
      prefs.setBool('isAuth', false);
      // prefs.setInt('currentLevel', 1);
    }
    else{
        Provider.of<AuthController>(ctx, listen: false).isAuth= prefs.getBool('isAuth')!;
    }
  }

  @override
   didChangeDependencies()  async {
    await didChangeLogic(context);
        
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background imageC:\Dhia\doudi\doudi\assets\images\splash.png
          Image.asset(
            'assets/images/splash.png', // Replace with your background image path
            fit: BoxFit.cover,
          ),
          // Center animated image
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: Image.asset(
                    'assets/images/doudi_logo1.png', // Replace with your animated image path
                    width: 300,
                    height: 300,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}