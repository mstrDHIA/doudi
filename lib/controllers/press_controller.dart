import 'dart:math';

import 'package:flutter/material.dart';

class PressController extends ChangeNotifier{

  int number=0;
  int? targetNumber;
  bool isSolved=false;


  void setTargetNumber(int? target) {
    if ((target == null)||(target==0)) {
      targetNumber = Random().nextInt(9) + 1; // Generates a random number between 1 and 9
    } else {
      targetNumber = target;
    }
    // notifyListeners();
  }

  incrementNumber(context){
    if(isSolved==false){
          
    if(number==9){
      number=0;
    }
    number++;
    if(number==targetNumber){
      isSolved=true;
    }
    notifyListeners();
  }
  else{
    Navigator.pop(context);
  }
 
  }

}