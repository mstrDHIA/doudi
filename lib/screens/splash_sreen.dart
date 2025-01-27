// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..forward();

//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );

//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         // Navigate to the next screen after the animation completes
//         // Navigator.of(context).pushReplacement(
//         //   MaterialPageRoute(builder: (context) => NextScreen()), // Replace with your next screen
//         // );
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Center(
//             child: AnimatedBuilder(
//               animation: _animation,
//               builder: (context, child) {
//                 return ClipPath(
//                   clipper: CircleClipper(_animation.value),
//                   child: Container(
//                     color: Colors.green,
//                   ),
//                 );
//               },
//             ),
//           ),
//           Center(
//             child: AnimatedOpacity(
//               opacity: _animation.value > 0.5 ? 1.0 : 0.0,
//               duration: Duration(milliseconds: 500),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/worm.png', // Replace with your logo asset
//                     width: 100,
//                     height: 100,
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'DOUDI',
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CircleClipper extends CustomClipper<Path> {
//   final double radiusFactor;

//   CircleClipper(this.radiusFactor);

//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     final radius = radiusFactor * size.longestSide;
//     path.addOval(Rect.fromCircle(
//       center: Offset(size.width / 2, size.height / 2),
//       radius: radius,
//     ));
//     return path;
//   }

//   @override
//   bool shouldReclip(CircleClipper oldClipper) {
//     return oldClipper.radiusFactor != radiusFactor;
//   }
// }

// class NextScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Next Screen'),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:match/screens/auth/login/welome_sreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fallAnimation;
  late AnimationController _sizeController;
  late Animation<double> _sizeAnimation;
  late AnimationController _finalSizeController;
  late Animation<double> _finalSizeAnimation;
  late AnimationController _opacityController;
  late Animation<double> _opacityAnimation;
  bool first_time = true;
  late double last_size;
  bool coverScreen = false;

  @override
  void didChangeDependencies() {
    last_size=MediaQuery.of(context).size.width *0.05;
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

    _finalSizeAnimation = Tween<double>(begin: 2.0*last_size, end: 100.0*last_size).animate(
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
        if(first_time==true){
          first_time = false;
          last_size = 2.0;
          _sizeController.reset();
          _sizeAnimation = TweenSequence<double>([
            TweenSequenceItem(
              tween: Tween(begin: last_size, end: last_size * 2.4).chain(CurveTween(curve: Curves.easeInOut)),
              weight: 20,
            ),
            TweenSequenceItem(
              tween: Tween(begin: last_size * 2.4, end: last_size * 1.8).chain(CurveTween(curve: Curves.bounceOut)),
              weight: 20,
            ),
            TweenSequenceItem(
              tween: Tween(begin: last_size*1.8, end: last_size * 2.2).chain(CurveTween(curve: Curves.easeInOut)),
              weight: 20,
            ),
            TweenSequenceItem(
              tween: Tween(begin: last_size * 2.2, end: last_size * 2.0).chain(CurveTween(curve: Curves.bounceOut)),
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
    _finalSizeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          coverScreen = true;
        });
        // _opacityController.forward();
        // Navigate to the next screen after a delay
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const WelcomeScreen()), // Replace with your next screen
          );
        });
      }
    });
  
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    
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
                //  last_size = MediaQuery.of(context).size.width *0.05 * _sizeAnimation.value;
                last_size= MediaQuery.of(context).size.width *0.05 * (_finalSizeController.isAnimating ? _finalSizeAnimation.value : _sizeAnimation.value);
          
                return Transform.translate(
                  offset: Offset(0, translateY),
                  child: Container(
                    width: last_size,
                    height: last_size,
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