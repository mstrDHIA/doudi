import 'package:flutter/material.dart';

class ColorsController extends ChangeNotifier{
  List<Color> colors=[Colors.blue,Colors.red,Colors.green,Colors.purple,Colors.yellow];


  changeColor(int index){
    // print(index);
    if(index<4){
      index++;
    }
    else{
      index=0;
    }
    
    // print(index);
    notifyListeners();
  }
  notify(){
    notifyListeners();
  } 
}