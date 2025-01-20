import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:match/controllers/click_controller.dart';
import 'package:provider/provider.dart';
import 'package:stroke_text/stroke_text.dart';

class NumberHolder extends StatefulWidget {
  final ClickController clickController;
  const NumberHolder({super.key, required this.clickController});

  @override
  _NumberHolderState createState() => _NumberHolderState(clickController: clickController);
}

class _NumberHolderState extends State<NumberHolder> {
  // int _randomNumber = 1;
  // late Timer _timer;
  // bool _showOverlay = false;
  final ClickController clickController;

  _NumberHolderState({required this.clickController});
  @override
  void initState() {
    super.initState();
    clickController.startTimer();
  }

  @override
  void dispose() {
    // _timer.cancel();
    super.dispose();
  }

  // void _startTimer() {
  //   _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
  //     setState(() {
  //       _randomNumber = Random().nextInt(9) + 1; // Generates a random number between 1 and 9
  //     });
  //   });
  // }

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: _showCorrectOverlay,
      child: Stack(
        children: [
          Container(
            color: Colors.transparent,
            child: Consumer<ClickController>(
              builder: (context,clickController,child) {
                return StrokeText(
                  text: clickController.randomNumber.toString(),
                  strokeColor: Colors.black,
                  strokeWidth: 3,
                  textStyle: const TextStyle(
                    fontSize: 250,
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }
            ),
          ),
          
        ],
      ),
    );
  }
}