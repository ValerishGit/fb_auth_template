import 'package:flutter/material.dart';

import 'constants.dart';

class HelperFunctions {
  static LinearGradient bgGradient() {
    return const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        g1,
        g1,
        Colors.black,
      ],
    );
  }

  static Widget wrapWithAnimatedBuilder({
    required Animation<Offset> animation,
    required Widget child,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) => FractionalTranslation(
        translation: animation.value,
        child: child,
      ),
    );
  }
}
