import 'package:dio/dio.dart';

class Apis {
  String baseurl="https://baca-2c0f-f698-40c3-9ff8-bc7f-5d2b-ae17-6dd7.ngrok-free.app/api/";
  static final Dio dio=Dio();
  final String login="token/";
  final String register="register/";
  // String login=baseurl+"login";
}