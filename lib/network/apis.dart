import 'package:dio/dio.dart';

class Apis {
  String baseurl="https://f9b4-2c0f-f698-40c4-812-4c94-fb71-fb41-f8ac.ngrok-free.app/api/";
  static final Dio dio=Dio();
  final String login="login/";
  final String register="register/";
  final String profile="profiles/";
  // String login=baseurl+"login";
}