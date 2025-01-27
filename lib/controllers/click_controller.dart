import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pausable_timer/pausable_timer.dart';
// import 'package:audioplayers/audioplayers.dart';

class ClickController extends ChangeNotifier{
  int randomNumber = 1;
  late PausableTimer _timer;
  bool showOverlay = false;
  // final AudioPlayer _audioPlayer = AudioPlayer();

  void startTimer() {
    _timer = PausableTimer.periodic(const Duration(seconds: 3), () {
      randomNumber = Random().nextInt(9) + 1; // Generates a random number between 1 and 9
      // print(randomNumber);
      notifyListeners();
    });
    _timer.start();
  }

  void showCorrectOverlay() {
    // print("clicked");
    _timer.pause();
    showOverlay = true;
    
    notifyListeners();
    _playSound(randomNumber == 1 ? 'assets/audio/correct.mp3' : 'assets/audio/incorrect.mp3');
    Future.delayed(const Duration(seconds: 1), () {
      showOverlay = false;
      randomNumber = Random().nextInt(9) + 1; // Generates a random number between 1 and 9
    _timer.reset();
    _timer.start();
      notifyListeners();
    });
    
    
    // _timer.start();
  }

  void _playSound(String soundFile) {
    // Audio.load(soundFile)..play()..dispose();
    // _audioPlayer.play(
    //   // Audio
    //   // AssetSource(soundFile)
    //   );
  }
}