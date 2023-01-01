// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserData {
  final String? displayName;
  final String? token;
  final String? email;
  final DateTime? lastLogin;

  UserData({
    this.displayName,
    this.token,
    this.email,
    this.lastLogin,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'token': token,
      'email': email,
      'lastLogin': lastLogin?.millisecondsSinceEpoch,
    };
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      lastLogin: map['lastLogin'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastLogin'] as int)
          : null,
    );
  }
}
