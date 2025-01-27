import 'package:dio/dio.dart';

class Apis {
  String baseurl="https://d330-2c0f-f698-41c5-9d89-5483-7302-e58c-532a.ngrok-free.app/api/";
  static final Dio dio=Dio();
  final String login="token/";
  final String register="register/";
  // String login=baseurl+"login";
}