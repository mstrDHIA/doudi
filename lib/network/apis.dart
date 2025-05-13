import 'package:dio/dio.dart';

class Apis {
  String baseurl="https://4dcc-2c0f-f698-4097-9de6-82b-3991-67f7-813f.ngrok-free.app/api/";
  static final Dio dio=Dio();
  final String login="login/";
  final String register="register/";
  final String profile="profiles/";
  // String login=baseurl+"login";
}