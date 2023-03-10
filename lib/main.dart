import 'package:fb_auth_template/middleware/login_guard.dart';
import 'package:fb_auth_template/utils/constants.dart';
import 'package:fb_auth_template/view/auth/login_screen.dart';
import 'package:fb_auth_template/view/auth/register_screen.dart';
import 'package:fb_auth_template/view/mainapp/home_screen.dart';
import 'package:fb_auth_template/view/mainapp/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/auth_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  AuthController authController = Get.put(AuthController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: "/", page: () => HomeScreen(), middlewares: [
          AuthGuard()
        ], children: [
          GetPage(
            name: "/profile/:id",
            page: () => ProfileScreen(),
          ),
        ]),
        GetPage(
          name: "/login",
          page: () => const LoginScreen(),
          middlewares: [LoginGuard()],
        ),
      ],
      title: 'Auth Template',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        hintColor: kPrimaryColor,
        highlightColor: kPrimaryColor,
        iconTheme: IconThemeData(color: kPrimaryColor),
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: kSecondaryColor),
      ),
      initialRoute: "/",
    );
  }
}
