import 'package:aban_tether_app/domain/entities/user.dart';

class UserModel {
  final User user;
  final DateTime createdAt;
  final String? password;

  UserModel({required this.user, required this.createdAt, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      user: User(
        id: json['id'],
        name: json['name'],
        phoneNumber: json['phone_number'],
        email: json['email'],
      ),
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['created_at']),
      password: json['password']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': user.id,
      'name': user.name,
      'phone_number': user.phoneNumber,
      'email': user.email,
      'created_at': createdAt.millisecondsSinceEpoch,
      'password':''
    };
  }
}
