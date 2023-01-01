import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(),
      centerTitle: false,
      backgroundColor: kPrimaryColor,
      title: InkWell(
          onTap: () => Get.offNamed('/'), child: const Text("APP NAME")),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              const Icon(Icons.login_outlined),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                  onTap: () => Get.offNamed('/login'), child: Text("Login")),
            ],
          ),
        )
      ],
      elevation: 5,
    );
  }
}
