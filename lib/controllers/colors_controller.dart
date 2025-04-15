import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ColorsController extends ChangeNotifier{
  List<Color> colors=[Colors.blue,Colors.red,Colors.green,Colors.purple,Colors.yellow,Colors.grey];
  List<Color> randomColors=[];
  List<Color> circleColors=[];
  List<bool> isValid=[false,false,false,false,false];
  int validCount=0;
  
  changeColor(int index){
    // circleColors[index]=colors[Random().nextInt(colors.length)];
    // print(index);
    if(validCount!=5){
      if(index<4){
      index++;
    }
    else{
      index=0;
    }
    
    // print(index);
    notifyListeners();
    }
    
    
  }


  getRandomColors(){
    randomColors.clear();
    circleColors.clear();
    for(int i=0;i<5;i++){
      randomColors.add(colors[Random().nextInt(colors.length-1)]);
      circleColors.add(colors[Random().nextInt(colors.length-1)]);
    }
    print(randomColors.length);
    // notifyListeners();
  }


  verify(Color color,int index, ConfettiController confettiController){
    if(validCount!=5){
      if(randomColors[index]==color){
      isValid[index]=true;
      validCount++;
    }
    else{
      
      if(isValid[index]==true){
        validCount--;
      }
      isValid[index]=false;
      // validCount--;
    }
   
    print(validCount);
    if(validCount==5){
      confettiController.play();
      print("Win");
    }
    else{
      print("Lose");
    }
    }
    

   
  }
  notify(){
    notifyListeners();
  } 
}