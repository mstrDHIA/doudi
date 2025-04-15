
import 'package:flutter/material.dart';
import 'package:match/controllers/auth_controller.dart';
import 'package:match/controllers/progress_controller.dart';
import 'package:match/screens/intro_screen.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late AuthController authController;
  late AnimationController _controller;
  late Animation<double> _fallAnimation;
  late AnimationController _sizeController;
  late Animation<double> _sizeAnimation;
  late AnimationController _finalSizeController;
  late Animation<double> _finalSizeAnimation;
  late AnimationController _opacityController;
  late Animation<double> _opacityAnimation;
  bool firstTime = true;
  late double lastSize;
  bool coverScreen = false;
  late ProgressController progressController;
  @override
  Future<void> didChangeDependencies() async {
    progressController.getCurrentNumber();
    lastSize=MediaQuery.of(context).size.width *0.05;
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _fallAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: -1.0, end: 1.1).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 80,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.1, end: 1.0).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 20,
      ),
    ]).animate(_controller);
_sizeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _sizeAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 2.4).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 2.4, end: 1.8).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.8, end: 2.2).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 2.2, end: 2.0).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 20,
      ),
    ]).animate(_sizeController);

    _finalSizeController = AnimationController(
      duration: const Duration(microseconds: 1),
      vsync: this,
    );

    _finalSizeAnimation = Tween<double>(begin: 2.0*lastSize, end: 100.0*lastSize).animate(
      CurvedAnimation(parent: _finalSizeController, curve: Curves.easeInOut),
    );

    _opacityController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _opacityController, curve: Curves.easeInOut),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _sizeController.forward();
      }
    });
    _sizeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if(firstTime==true){
          firstTime = false;
          lastSize = 2.0;
          _sizeController.reset();
          _sizeAnimation = TweenSequence<double>([
            TweenSequenceItem(
              tween: Tween(begin: lastSize, end: lastSize * 2.4).chain(CurveTween(curve: Curves.easeInOut)),
              weight: 20,
            ),
            TweenSequenceItem(
              tween: Tween(begin: lastSize * 2.4, end: lastSize * 1.8).chain(CurveTween(curve: Curves.bounceOut)),
              weight: 20,
            ),
            TweenSequenceItem(
              tween: Tween(begin: lastSize*1.8, end: lastSize * 2.2).chain(CurveTween(curve: Curves.easeInOut)),
              weight: 20,
            ),
            TweenSequenceItem(
              tween: Tween(begin: lastSize * 2.2, end: lastSize * 2.0).chain(CurveTween(curve: Curves.bounceOut)),
              weight: 20,
            ),
          ]).animate(_sizeController);
          _sizeController.forward();
        }
        else{
          _finalSizeController.forward();
          _opacityController.forward();
        }
        
      }
      
    });
    SharedPreferences prefs=await SharedPreferences.getInstance();
    _finalSizeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          coverScreen = true;
        });
        // _opacityController.forward();
        // Navigate to the next screen after a delay
        Future.delayed(const Duration(seconds: 2), () async {
          // ignore: use_build_context_synchronously
          // if
          String? deviceId =
          await MobileDeviceIdentifier().getDeviceId();
          deviceId = deviceId!.replaceAll(":", "");
          prefs.getBool('isAuth')!?authController.login(deviceId, '12345', context):
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>  const IntroScreen()), // Replace with your next screen
          );
        });
      }
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
        Provider.of<AuthController>(context, listen: false).isAuth= prefs.getBool('isAuth')!;
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    authController=Provider.of<AuthController>(context, listen: false);
    progressController=Provider.of<ProgressController>(context, listen: false);
    super.initState();
    // _controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     // Navigate to the next screen after the animation completes
    //     // Navigator.of(context).pushReplacement(
    //     //   MaterialPageRoute(builder: (context) => NextScreen()), // Replace with your next screen
    //     // );
    //   }
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    _sizeController.dispose();
    _finalSizeController.dispose();
    _opacityController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: coverScreen
                ? Container(
                  decoration: const BoxDecoration(gradient:LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF52C91B),
              Color(0xFF29630D),
            ],
          ), ),
                    // color: Colors.green,
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
            child: 
            AnimatedBuilder(
              animation: _opacityAnimation,
              builder: (context,child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  // duration: Duration(seconds: 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/worm.png', // Replace with your logo asset
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'DOUDI',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                
                );
              }
            ),
          ),
                  )
                : AnimatedBuilder(
              animation: Listenable.merge([_fallAnimation, _sizeAnimation]),
              builder: (context, child) {
                double translateY = -MediaQuery.of(context).size.height  * (1 - _fallAnimation.value);
                //  lastSize = MediaQuery.of(context).size.width *0.05 * _sizeAnimation.value;
                lastSize= MediaQuery.of(context).size.width *0.05 * (_finalSizeController.isAnimating ? _finalSizeAnimation.value : _sizeAnimation.value);
          
                return Transform.translate(
                  offset: Offset(0, translateY),
                  child: Container(
                    width: lastSize,
                    height: lastSize,
                    decoration: const BoxDecoration(
                      // color: Colors.green,
                     gradient:LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF52C91B),
              Color(0xFF29630D),
            ],
          ), 
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            ),
          ),
          // Center(
          //   child: AnimatedOpacity(
          //     opacity: _opacityAnimation.value,
          //     duration: Duration(seconds: 1),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Image.asset(
          //           'assets/images/worm.png', // Replace with your logo asset
          //           width: 100,
          //           height: 100,
          //         ),
          //         const SizedBox(height: 20),
          //         const Text(
          //           'DOUDI',
          //           style: TextStyle(
          //             fontSize: 24,
          //             color: Colors.white,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Next Screen'),
      ),
    );
  }
}