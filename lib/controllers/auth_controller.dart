import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:match/network/login_network.dart';
import 'package:match/screens/numbers/numbers_menu.dart';

class AuthController extends ChangeNotifier{
  bool _isAuth = false;
  bool get isAuth => _isAuth;
  AuthNetwork authNetwork = AuthNetwork();
  Future<void> login(String email, String password,context) async {
    Response response = await authNetwork.login(email, password);
    if(response.statusCode == 200){
      _isAuth = true;
      Navigator.push(context, MaterialPageRoute(builder: (context)=> NumbersMenuScreen()));
      notifyListeners();
    }
    // Call the login network
    // If the login is successful
    // _isAuth = true;
    // notifyListeners();
  }

  void logout(){
    _isAuth = false;
    notifyListeners();
  }
}