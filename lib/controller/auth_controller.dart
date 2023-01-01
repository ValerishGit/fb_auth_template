import 'package:fb_auth_template/modal/user_modal.dart';
import 'package:fb_auth_template/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<UserData> currentUser = UserData().obs;
  User? get fbUser => FirebaseAuth.instance.currentUser;

  AuthController() {
    if (fbUser != null) {
      setDBUser();
      //Go to main Page
      print("Connected");
    } else {
      //Go To Login Screen;
      print("Not Connected");
    }
  }

  void setDBUser() async {
    currentUser(await FirebaseService.getUserById(fbUser!.uid));
  }
}
