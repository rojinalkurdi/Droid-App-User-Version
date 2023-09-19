import 'package:flutter/material.dart';
import 'package:gapp01/view/widget/onBoarding/button.dart';
import 'package:gapp01/view/widget/onBoarding/slider.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import '../../controller/onboarding_controller.dart';
import '../widget/onBoarding/dot_controller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: pageView(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Dots(),
                  Spacer(flex: 2),
                  ButtononBording(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
