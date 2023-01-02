import 'package:fb_auth_template/modal/user_modal.dart';
import 'package:fb_auth_template/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<UserData> currentUser = UserData().obs;
  RxBool isLoading = false.obs;
  RxString errorText = "".obs;
  User? get fbUser => FirebaseAuth.instance.currentUser;

  TextEditingController userText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  bool authFlag = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        if (authFlag == false) {
          print('User is signed in!');
          UserData? userData = await FirebaseService.getUserById(user.uid);
          print(userData!.displayName);
          currentUser(userData);
          authFlag = true;
        }
      }
    });
  }

  void setDBUser(UserData user) async {
    currentUser(user);
  }

  bool get isLoggedIn => FirebaseAuth.instance.currentUser != null;

  Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
    currentUser(UserData());
    Get.offNamed('/login');
  }

  void signUpUser() async {
    isLoading(true);
    errorText("");
    try {
      if (!validateSignUpFields()) return;
      UserCredential userCred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailText.text, password: passwordText.text);
      userCred.user!.updateDisplayName(userText.text);
      UserData newUser = UserData(
          displayName: userText.text,
          email: emailText.text,
          token: userCred.user!.uid);
      await FirebaseService.createUser(newUser);
      userCred = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailText.text, password: passwordText.text);
      Get.offNamed('/');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        errorText("Wrong Email or Password");
      } else if (e.code == 'wrong-password') {
        errorText("Wrong Email or Password");
      } else if (e.code == 'invalid-email') {
        errorText("Email Address is not Valid");
      }
      return;
    } finally {
      isLoading(false);
    }
  }

  Future<void> signInUserWithCred() async {
    isLoading(true);
    errorText("");
    try {
      UserCredential userCred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailText.text, password: passwordText.text);
      UserData? userData =
          await FirebaseService.getUserById(userCred.user!.uid);
      currentUser(userData);
      Get.offNamed('/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorText("Wrong Email or Password");
      } else if (e.code == 'wrong-password') {
        errorText("Wrong Email or Password");
      } else if (e.code == 'invalid-email') {
        errorText("Email Address is not Valid");
      }
    } finally {
      isLoading(false);
    }
  }

  bool validateSignUpFields() {
    if (userText.text.length <= 4) {
      errorText("Username is Too Short! (min 5 characters)");
      return false;
    }
    if (emailText.text.isEmpty) {
      errorText("Email cant be Empty!");
      return false;
    }
    return true;
  }
}
