import 'package:flutter/material.dart';

import '../../utils/helper_functions.dart';

class AddInfoScreen extends StatelessWidget {
  const AddInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: HelperFunctions.bgGradient(),
        ),
      ),
    );
  }
}
