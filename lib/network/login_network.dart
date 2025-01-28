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
}