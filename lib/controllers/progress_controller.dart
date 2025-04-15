import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressController extends ChangeNotifier{
  int currentNumber=1;
  Map<String, bool> progressData={
    'writing':false,
    'coloring':false,
    'puzzle':false,
    'press':false,
    'click':false,
    'count':false,
    'colors':false,
    'story':false,
  };
  
  getCurrentNumber() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();  
    currentNumber=prefs.getInt('currentLevel') ?? 1;
  }

  updateCurrentNumber(number){
    // currentNumber++;
    if(number==currentNumber+1){
      
      currentNumber=number;
      SharedPreferences.getInstance().then((prefs) {
      prefs.setInt('currentLevel', number);
    });
    notifyListeners();
    }
    
  }

}