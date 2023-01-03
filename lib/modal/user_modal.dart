// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserData {
  final String? uid;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? aboutMe;
  final String? email;
  final DateTime? lastLogin;

  UserData({
    this.firstName,
    this.lastName,
    this.gender,
    this.aboutMe,
    this.uid,
    this.email,
    this.lastLogin,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': uid,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'aboutMe': aboutMe,
      'email': email,
      'lastLogin': lastLogin?.millisecondsSinceEpoch,
    };
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      aboutMe: map['aboutMe'] != null ? map['aboutMe'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      lastLogin: map['lastLogin'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastLogin'] as int)
          : null,
    );
  }
}
