import 'package:dio/dio.dart';

class Apis {
  String baseurl="https://80c1-2c0f-f698-41c6-a3a6-1b9-c29d-b4d1-fd17.ngrok-free.app/api/";
  static final Dio dio=Dio();
  final String login="login/";
  final String register="register/";
  final String profile="profiles/";
  // String login=baseurl+"login";
}