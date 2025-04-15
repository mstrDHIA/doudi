class Profile {
  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? qrCode;
  String? sex;
  String? city;
  String? address;
  int? role;
  int? age;
  String? deviceId;
  // User? user;

  Profile(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.qrCode,
      this.role,
      this.age,
      this.deviceId,
      this.sex,
      this.address,
      this.city
      // this.user
      });

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    qrCode = json['qr_code'];
    role = json['role'];
    age = json['age'];
    deviceId = json['device_id'];
    city = json['city'];
    address = json['address'];
    sex = json['sex'];
    // user =  User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['qr_code'] = qrCode;
    data['role'] = role;
    data['age'] = age;
    data['device_id'] = deviceId;
    data['city'] = city;
    data['address'] = address;
    data['sex'] = sex;
    return data;
  }
}
