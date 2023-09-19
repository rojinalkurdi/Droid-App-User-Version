import 'package:flutter/material.dart';
import 'package:gapp01/core/constant/image.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      onBoardingImages.logoAuth,
      height: 180,
    );
  }
}
