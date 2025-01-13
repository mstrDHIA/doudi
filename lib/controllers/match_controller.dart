import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:match/models/question.dart';

class MatchController extends ChangeNotifier{
  int num =1;
  int questionNumber=3;
  List<int> answers=[];
  bool isValidating=false;
  bool isSolved=false;
  List<String> allQuestions=[
    'assets/images/dice1.png',
    'assets/images/dice2.png',
    'assets/images/dice3.png',
    'assets/images/dice4.png',
    'assets/images/dice5.png',
    'assets/images/dice6.png'
    // Question(img: 'assets/images/dice1.png',answer: 1),
    // Question(img: 'assets/images/dice2.png',answer: 2),
    // Question(img: 'assets/images/dice3.png',answer: 3),
    // Question(img: 'assets/images/dice4.png',answer: 4),
    // Question(img: 'assets/images/dice5.png',answer: 5),
    // Question(img: 'assets/images/dice6.png',answer: 6),

  ];
  List<int> numbers=[];
  List<String> gameQuestions=[];

  initGame(){
  
    gameQuestions.clear();
    List<int> indexes=[];
      while(indexes.length<3){
      int randomIndex=Random().nextInt(6);
      if ((indexes.contains(randomIndex)==false)&&(randomIndex!=0)){
        numbers.add(1);
        indexes.add(randomIndex);
        answers.add(randomIndex+1);
        gameQuestions.add(allQuestions[randomIndex]);
      }}
    
  }

  addNum({required int index}){
    if(numbers[index]<6){
    numbers[index]++;
    notify();
    }
  }
  reduceNum({required int index}){
    if(numbers[index]>1){
    numbers[index]--;
    notify();
    }
  }

  toggleValidation(){
    isValidating=!isValidating;
    notify();
  }
  notify(){
    notifyListeners();
  }
}