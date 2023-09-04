import 'package:flutter/material.dart';
import 'custom_colors.dart';

class BackgroundGradient {
  BoxDecoration buildGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [gradientColor1, gradientColor2],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  BoxDecoration buildGradient2() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [gradientDarkColor1, gradientDarkColor2],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(45),
        topRight: Radius.circular(45),
      ),
    );
  }
}
