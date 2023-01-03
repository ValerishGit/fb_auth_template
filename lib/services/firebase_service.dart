import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_auth_template/modal/user_modal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  static Future<UserData?> getUserById(String uid) async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return null;
    var user = await FirebaseFirestore.instance
        .collection('usersCollection')
        .doc(uid)
        .get();
    if (user.data() == null) {
      return null;
    }
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
    try {
      await FirebaseFirestore.instance
          .collection('usersCollection')
          .doc(user.uid)
          .set(user.toMap());
    } catch (e) {
      print(e);
    }
  }

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
