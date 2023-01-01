import 'dart:math' as math;

import 'package:fb_auth_template/utils/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import 'components/center_widget/center_widget.dart';
import 'components/login_content.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(64.0), child: CustomAppBar()),
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Container(
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
              const LoginContent(),
            ],
          ),
        ),
      ),
    );
  }
}
