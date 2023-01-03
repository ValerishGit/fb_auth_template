import 'package:fb_auth_template/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'components/login_content.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: HelperFunctions.bgGradient(),
          ),
          child: Stack(
            children: [
              LoginContent(),
            ],
          ),
        ),
      ),
    );
  }
}
