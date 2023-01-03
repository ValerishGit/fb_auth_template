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
  RxList<Map<String, dynamic>> missingFields = <Map<String, dynamic>>[].obs;
  TextEditingController userText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  bool authFlag = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FirebaseAuth.instance.userChanges().listen((User? user) async {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        if (authFlag == false) {
          print('User is signed in!');
          UserData? userData = await FirebaseService.getUserById(user.uid);
          currentUser(userData);
          _missingFields(userData!);
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
    try {
      if (!validateSignUpFields()) return;
      UserCredential userCred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailText.text, password: passwordText.text);
      UserData newUser = UserData(
          email: emailText.text,
          uid: userCred.user!.uid,
          lastLogin: DateTime.now());
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

  List<Map<String, dynamic>> _missingFields(UserData userData) {
    List<Map<String, dynamic>> temp = [];
    userData.toMap().forEach((key, value) {
      if (key == 'token' || key == 'lastName') return;
      if (value == null) missingFields.add({key: value});
    });
    print(missingFields);
    return temp;
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

  bool isMissingData() {
    if (currentUser.value.aboutMe == null) return true;
    return false;
  }

  Future<void> signInWithGoogle() async {
    isLoading(true);
    errorText("");
    try {
      UserCredential userCred = await FirebaseService.signInWithGoogle();
      UserData? _userData =
          await FirebaseService.getUserById(userCred.user!.uid);
      if (_userData == null) {
        UserData newUser = UserData(
            firstName: userCred.user!.displayName,
            email: userCred.user!.email,
            uid: userCred.user!.uid,
            lastLogin: DateTime.now());
        await FirebaseService.createUser(newUser);
        currentUser(newUser);
      } else {
        print("User Exists");
      }
      Get.offNamed('/');
    } catch (e) {}
  }
}
