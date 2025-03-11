import 'package:dio/dio.dart';

class Apis {
  String baseurl="https://c05d-2c0f-f698-4096-f96f-5893-57ac-6b82-989b.ngrok-free.app/api/";
  static final Dio dio=Dio();
  final String login="login/";
  final String register="register/";
  final String profile="profiles/";
  // String login=baseurl+"login";
}