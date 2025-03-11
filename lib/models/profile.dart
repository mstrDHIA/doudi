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
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['qr_code'] = this.qrCode;
    data['role'] = this.role;
    data['age'] = this.age;
    data['device_id'] = this.deviceId;
    data['city'] = this.city;
    data['address'] = this.address;
    data['sex'] = this.sex;
    return data;
  }
}
