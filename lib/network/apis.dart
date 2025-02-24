import 'package:dio/dio.dart';

class Apis {
  String baseurl="https://efd0-2c0f-f698-4096-d11f-5171-24ee-a94e-97ef.ngrok-free.app/api/";
  static final Dio dio=Dio();
  final String login="token/";
  final String register="register/";
  // String login=baseurl+"login";
}