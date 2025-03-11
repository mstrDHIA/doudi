import 'package:match/network/apis.dart';

class AuthNetwork {
  Apis apis = Apis();
  // Future<Response>
   login(String email, String password) async {
    print('aaaa');
    try {
      print('bbbb');
      print(email);
      print(password);
      // print(apis.baseurl + apis.login);
      var response = await Apis.dio.post(apis.baseurl + apis.login, data: {
        "username": email,
        "device_id":email,
        "password": password,
      });
      print('cccc');
      if (response.statusCode == 200) {
        print('dddd');
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

      // print(deviceId);
      // print(apis.baseurl + apis.login);
      var response = await Apis.dio.post(apis.baseurl + apis.register, data: {
        "username": deviceId,
        "password": password,
        // "device_id":deviceId
      });
      print('end network');
      return response;
      // if (response.statusCode == 200) {
      //   return response;
      //   // return true;
      // }
      // return false;
    // } catch (e) {
    //   // print(e);
    //   // return false;
    // }
  }


  editProfile(data,id) async {
    print(data);
    print(id);
    
    var response = await Apis.dio.put(apis.baseurl + apis.profile+id.toString()+'/', data: data
    // {
    //     "username": email,
    //     "password": password,
    //     // "device_id":deviceId
    //   }
      );
      print('end network');
      return response;
  }
}