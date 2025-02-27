import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:match/network/auth_network.dart';
import 'package:match/screens/auth/login/welcome_sreen.dart';
import 'package:match/screens/numbers/numbers_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier{
  bool isAuth = false;
  
  // bool get isAuth => _isAuth;
  AuthNetwork authNetwork = AuthNetwork();
  Future<void> login(String email, String password,context) async {
    
    Response response = await authNetwork.login(email, password);
    if(response.statusCode == 200){
      SharedPreferences prefs=await SharedPreferences.getInstance();
      isAuth = true;
      await prefs.setBool('isAuth', true);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const NumbersMenuScreen()));

      notifyListeners();
    }
    // Call the login network
    // If the login is successful
    // _isAuth = true;
    // notifyListeners();
  }



  Future<void> register(String deviceId, String password,context) async {
    print('start controller');
    Response response = await authNetwork.register(deviceId, password,deviceId);
    print('result controller');
    if(response.statusCode == 201){
      SharedPreferences prefs=await SharedPreferences.getInstance();
      isAuth = true;
      await prefs.setBool('isAuth', true);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const NumbersMenuScreen()));
      notifyListeners();
    }

    notifyListeners();
  }



  Future<void> logout(context) async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    isAuth = false;
    await prefs.setBool('isAuth', false);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const WelcomeScreen()), (route) => false);
    notifyListeners();
  }
}