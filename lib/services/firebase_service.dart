import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_auth_template/modal/user_modal.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static Future<UserData?> getUserById(String uid) async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return null;
    var user = await FirebaseFirestore.instance
        .collection('usersCollection')
        .doc(uid)
        .get();
    UserData userData = UserData.fromMap(user.data()!);
    return userData;
  }

  static updateLastLogin() async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await FirebaseFirestore.instance
          .collection('usersCollection')
          .doc(currentUser.uid)
          .update({"lastLogin": DateTime.now()}).catchError((e) => print(e));
    }
  }

  static Future<void> createUser(UserData user) async {
    await FirebaseFirestore.instance
        .collection('usersCollection')
        .doc(user.token)
        .set({
      "displayName": user.displayName,
      "email": user.email,
      "token": user.token,
      "lastLogin": DateTime.now()
    });
  }
}
