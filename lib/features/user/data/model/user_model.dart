import 'package:orio_attendance_app_flutter/features/user/domain/entity/user_entity.dart';

class UserModel extends User {
  const UserModel({
    required String name,
    required String token,
    required String otp,
    required String phone,
  }) : super(
          name: name,
          token: token,
          otp: otp,
          phone: phone,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      token: json['token'],
      otp: json['otp'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "token": token,
        "otp": otp,
        "phone": phone,
      };
}
