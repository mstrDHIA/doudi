import 'package:match/models/profile.dart';

class User {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  Profile? profile;
  User({this.id, this.username, this.email, this.firstName, this.lastName,this.profile});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    // profile =  Profile.fromJson(json['profile']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}
