import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return FirebaseAuth.instance.currentUser == null
        ? null
        : const RouteSettings(name: '/');
  }
}

class AuthGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return FirebaseAuth.instance.currentUser != null
        ? null
        : const RouteSettings(name: '/login');
  }
}
