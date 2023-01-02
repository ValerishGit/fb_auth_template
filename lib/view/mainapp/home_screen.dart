import 'package:fb_auth_template/controller/auth_controller.dart';
import 'package:fb_auth_template/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  AuthController authController = Get.find();

  Widget topWidget(double screenWidth) {
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          gradient: const LinearGradient(
            begin: Alignment(-0.2, -0.8),
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(0, 56, 142, 164), kPrimaryColor],
          ),
        ),
      ),
    );
  }

  Widget bottomWidget(double screenWidth) {
    return Container(
      width: 1.5 * screenWidth,
      height: 1.5 * screenWidth,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment(0.6, -1.1),
          end: Alignment(0.7, 0.8),
          colors: [
            kPrimaryColor,
            Color.fromARGB(0, 56, 142, 164),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(64.0), child: CustomAppBar()),
      body: Center(
        child: Container(
          color: kBackgroundColor,
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [
              Positioned(
                top: -160,
                left: -30,
                child: topWidget(screenSize.width),
              ),
              Positioned(
                bottom: -180,
                left: -40,
                child: bottomWidget(screenSize.width),
              ),
              Column(
                children: [
                  authController.isLoggedIn
                      ? Obx(
                          () => Text(
                              authController.currentUser.value.displayName!),
                        )
                      : Text("Not Connected"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
