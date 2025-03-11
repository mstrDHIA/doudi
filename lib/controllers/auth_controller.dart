import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:match/models/profile.dart';
import 'package:match/models/user.dart';
import 'package:match/network/auth_network.dart';
import 'package:match/screens/auth/login/welcome_sreen.dart';
import 'package:match/screens/numbers/numbers_menu.dart';
import 'package:match/screens/profile/add_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier{
  bool isAuth = false;
  bool hasProfile = false;
  late User currentUser;
  // bool get isAuth => _isAuth;
  AuthNetwork authNetwork = AuthNetwork();
  Future<void> login(String email, String password,context) async {
    print('bbb');
    
    Response response = await authNetwork.login(email, password);
    print('ddd');
    if(response.statusCode == 200){
      print('eee');
      SharedPreferences prefs=await SharedPreferences.getInstance();
      print('fff');
      isAuth = true;
      print('ggg');
      await prefs.setBool('isAuth', true);
      print('hhh');
      saveCredintials(email, password, response.data);
      print('iii');
      if(prefs.getBool( 'hasProfile') == true){
        print('jjj');
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const NumbersMenuScreen()));
      }
      else{
        print('kkk');
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  AddProfileScreen()));
      }
      
      notifyListeners();
    }
    // Call the login network
    // If the login is successful
    // _isAuth = true;
    // notifyListeners();
  }

  saveCredintials(String username, String password,Map<String,dynamic> data) async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    if(data['profile'] != null&&data['profile']['first_name']!=null&&data['profile']['first_name']!=''){
      hasProfile = true;
      await prefs.setBool('hasProfile', true);
    }
    currentUser = User.fromJson(data['user']);
    currentUser.profile = Profile.fromJson(data['profile']);
    print(data);
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }



  Future<void> register(String deviceId, String password,context) async {
    print('start controller');
    Response response = await authNetwork.register(deviceId, password,deviceId);
    print('result controller');
    if(response.statusCode == 201){
      SharedPreferences prefs=await SharedPreferences.getInstance();
      isAuth = true;
      await prefs.setBool('isAuth', true);
      await prefs.setBool('hasProfile', false);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const NumbersMenuScreen()));
      notifyListeners();
    }

    notifyListeners();
  }



  Future<void> logout(context) async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    isAuth = false;
    await prefs.setBool('isAuth', false);
    await prefs.setBool('hasProfile', false); 
    await prefs.remove('username');
    await prefs.remove('password');
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const WelcomeScreen()), (route) => false);
    notifyListeners();
  }

  editProfile(context,{String? firstName,String? lastName,String? email,String? phone,String? sex,String? city,String? address,String? age,}) async {
    Profile profile=Profile(
      id: currentUser.profile!.id,
      role: currentUser.profile!.role,
      // deviceId: ,
      qrCode: 'a',
      address: address,
      age: int.parse(age!),
      city: city,
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: phone.toString(),
      deviceId: currentUser.username,
      sex: sex,
    );
    print(firstName);
    Map<String,dynamic> data=profile.toJson();
    data['user']={
      'id':currentUser.id,
      'username':'a',
      'password':'12345',
    };
    Response response = await authNetwork.editProfile(data,currentUser.profile!.id);
    if(response.statusCode==200){
      SharedPreferences prefs=await SharedPreferences.getInstance();
      await prefs.setBool('hasProfile', true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NumbersMenuScreen()));
    }
  }

}