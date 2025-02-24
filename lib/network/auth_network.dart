import 'package:match/network/apis.dart';

class AuthNetwork {
  Apis apis = Apis();
  // Future<Response>
   login(String email, String password) async {
    try {
      // print(apis.baseurl + apis.login);
      var response = await Apis.dio.post(apis.baseurl + apis.login, data: {
        "username": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        return response;
        // return true;
      }
      // return false;
    } catch (e) {
      // print(e);
      // return false;
    }
  }

  register(String email, String password,String deviceId) async {
    // try {
      print(apis.baseurl + apis.register);
      print(email);
      print(password);
      print(deviceId);
      // print(apis.baseurl + apis.login);
      var response = await Apis.dio.post(apis.baseurl + apis.register, data: {
        "username": email,
        "password": password,
        // "device_id":deviceId
      });
      print('end network');
      return response;
      if (response.statusCode == 200) {
        return response;
        // return true;
      }
      // return false;
    // } catch (e) {
    //   // print(e);
    //   // return false;
    // }
  }
}