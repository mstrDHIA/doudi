import 'package:flutter/material.dart';

class PressController extends ChangeNotifier{

  int number=0;

  incrementNumber(){
    if(number==9){
      number=0;
    }
    number++;
    notifyListeners();
  }
}