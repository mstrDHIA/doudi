import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressController extends ChangeNotifier{
  int currentNumber=1;
  
  getCurrentNumber() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();  
    return prefs.getInt('currentLevel') ?? 1;
  }

}