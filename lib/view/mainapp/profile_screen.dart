import 'package:fb_auth_template/controller/auth_controller.dart';
import 'package:fb_auth_template/services/firebase_service.dart';
import 'package:fb_auth_template/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../modal/user_modal.dart';
import '../../utils/helper_functions.dart';
import '../widgets/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthController authController = Get.find();
  UserData? userData = UserData();
  bool isLocal = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUser();
  }

  void loadUser() async {
    UserData? user = await FirebaseService.getUserById(Get.parameters["id"]!);
    if (user!.uid == FirebaseAuth.instance.currentUser!.uid) {
      isLocal = true;
    }
    setState(() {
      userData = user;
    });
  }

  Widget noUser() {
    return const Center(
      child: Text("USER NOT FOUND"),
    );
  }

  Widget userPageContent() {
    return SafeArea(
      child: Center(
          child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      !isLocal
                          ? FloatingActionButton.extended(
                              onPressed: () {},
                              heroTag: 'follow',
                              elevation: 0,
                              label: Text(
                                  authController.currentUser.value.firstName ??
                                      ""),
                              icon: const Icon(Icons.person_add_alt_1),
                            )
                          : FloatingActionButton.extended(
                              onPressed: () {
                                authController.signOutUser();
                              },
                              heroTag: 'logout',
                              elevation: 0,
                              label: const Text("Logout"),
                              icon: const Icon(Icons.logout)),
                    ],
                  )))
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(64.0), child: CustomAppBar()),
        body: Container(
            decoration: BoxDecoration(
              gradient: HelperFunctions.bgGradient(),
            ),
            child: userData == null ? noUser() : userPageContent()));
  }
}
