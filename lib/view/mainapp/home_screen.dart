import 'package:fb_auth_template/controller/auth_controller.dart';
import 'package:fb_auth_template/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/helper_functions.dart';
import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64.0), child: CustomAppBar()),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: HelperFunctions.bgGradient(),
          ),
          width: screenSize.width,
          height: screenSize.height,
          child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: HomeSection()),
          ),
        ),
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  HomeSection({
    super.key,
  });

  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Stack(children: [
              Transform.rotate(
                angle: 0.2,
                child: const Icon(
                  Icons.question_mark_outlined,
                  size: 250,
                  color: kSecondaryColor,
                ),
              ),
            ])),
        const SizedBox(
          height: 50,
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {},
                  child: Text(
                    "Daily Run".toUpperCase(),
                    style: TextStyle(
                        wordSpacing: 5,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: kPrimaryColor,
                        fontFamily: GoogleFonts.varelaRound().fontFamily),
                  )),
              const SizedBox(
                height: 22,
              ),
              InkWell(
                  onTap: () {},
                  child: Text(
                    "settings".toUpperCase(),
                    style: TextStyle(
                        wordSpacing: 5,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: kPrimaryColor,
                        fontFamily: GoogleFonts.varelaRound().fontFamily),
                  )),
              const SizedBox(
                height: 22,
              ),
              InkWell(
                  onTap: () {},
                  child: Text(
                    "profile".toUpperCase(),
                    style: TextStyle(
                        wordSpacing: 5,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: kPrimaryColor,
                        fontFamily: GoogleFonts.varelaRound().fontFamily),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
