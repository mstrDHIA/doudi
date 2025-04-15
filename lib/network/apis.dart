import 'package:dio/dio.dart';

class Apis {
  String baseurl="https://0256-2c0f-f698-40c4-6d66-651e-fd25-19b5-ea92.ngrok-free.app/api/";
  static final Dio dio=Dio();
  final String login="login/";
  final String register="register/";
  final String profile="profiles/";
  // String login=baseurl+"login";
}