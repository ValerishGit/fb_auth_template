import 'package:fb_auth_template/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants.dart';

class LoginContent extends StatelessWidget {
  LoginContent({Key? key}) : super(key: key);
  final AuthController authController = Get.find();

  Widget inputField(
      String hint, IconData iconData, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: SizedBox(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: controller,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: kSecondaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.grey)),
                fillColor: Colors.white,
                hintText: hint,
                prefixIcon: Icon(
                  iconData,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget errorText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          height: 20,
          child: Obx(() => Text(
                authController.errorText.value,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              )),
        ),
      ),
    );
  }

  Widget loginButton(String title, onClick) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: onClick,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: const StadiumBorder(),
            backgroundColor: kSecondaryColor,
            elevation: 8,
            shadowColor: Colors.black87,
          ),
          child: Obx(
            () => !authController.isLoading.value
                ? Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : const SizedBox(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'or',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget logos() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialLoginButton(
            buttonTxt: "Continue with Google",
            imageLogo: 'assets/images/google.png',
            onClick: () {
              authController.signInWithGoogle();
            },
          ),
          const SizedBox(height: 24),
          SocialLoginButton(
            buttonTxt: "Continue with Facebook",
            imageLogo: 'assets/images/facebook.png',
            onClick: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: SizedBox(
                width: 500,
                child: Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Welcome\nBack',
                        style: TextStyle(
                          fontSize: 40,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    logos(),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Montserrat',
                  ),
                  children: [
                    TextSpan(
                      text: 'We will NEVER post anything on your behalf! ',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.buttonTxt,
    required this.imageLogo,
    required this.onClick,
  });
  final String buttonTxt;
  final String imageLogo;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        onPressed: onClick,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(imageLogo),
                height: 18.0,
                width: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 8),
                child: Text(
                  buttonTxt,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
