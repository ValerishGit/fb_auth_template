import 'package:fb_auth_template/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
  }) : super(key: key);

  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(),
      centerTitle: false,
      backgroundColor: Colors.transparent,
      title: InkWell(
          onTap: () => Get.offNamed('/'), child: const Text("APP NAME")),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: FirebaseAuth.instance.currentUser == null
              ? InkWell(
                  onTap: () => Get.offNamed('/login'),
                  child: Row(
                    children: const [
                      Icon(Icons.login_outlined),
                      Text("Login"),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                )
              : InkWell(
                  onTap: () => Get.toNamed(
                      '/profile/${FirebaseAuth.instance.currentUser!.uid}'),
                  child: const Icon(Icons.person),
                ),
        ),
      ],
      elevation: 0,
    );
  }
}
