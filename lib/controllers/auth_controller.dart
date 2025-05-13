import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:doudi/models/profile.dart';
import 'package:doudi/models/user.dart';
import 'package:doudi/network/auth_network.dart';
import 'package:doudi/screens/auth/login/welcome_sreen.dart';
import 'package:doudi/screens/numbers/numbers_menu.dart';
import 'package:doudi/screens/profile/add_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier{
  bool isAuth = false;
  bool isLoading = false;
  bool hasProfile = false;
  late User currentUser;
  // bool get isAuth => _isAuth;
  AuthNetwork authNetwork = AuthNetwork();
  Future<void> login(String email, String password,context) async {
    try{
      isLoading = true;
    notifyListeners();
    // print(object)
    print(email)  ;
    print(password);
    Response response = await authNetwork.login(email, password);
    print(email)  ;
    print(password);
    if(response.statusCode == 200){
      SharedPreferences prefs=await SharedPreferences.getInstance();
      isAuth = true;
      await prefs.setBool('isAuth', true);
      saveCredintials(email, password, response.data);
      if(prefs.getBool( 'hasProfile') == true){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const NumbersMenuScreen()));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const NumbersMenuScreen()));

        // Navigator.push(context, MaterialPageRoute(builder: (context)=>  AddProfileScreen()));
      }
      isLoading = false;
      notifyListeners();
    }

    }catch(e){
      isLoading = false;
      notifyListeners();
      print(e);
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
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }



  Future<void> register(String deviceId, String password,context) async {
    try{
      isLoading = true;
    notifyListeners();
      Response response = await authNetwork.register(deviceId, password,deviceId);
    if(response.statusCode == 201){
      SharedPreferences prefs=await SharedPreferences.getInstance();
      isAuth = true;
      await prefs.setBool('isAuth', true);
      await prefs.setBool('hasProfile', false);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const NumbersMenuScreen()));
      isLoading = false;
      notifyListeners();
    }
    }catch(e){
      isLoading = false;
      notifyListeners();
      print(e);
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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const NumbersMenuScreen()));
    }
  }

}