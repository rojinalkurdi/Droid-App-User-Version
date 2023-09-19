import 'package:flutter/material.dart';
import 'package:gapp01/core/constant/colors.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';

class ButtononBording extends GetView<OnBoardingControllerImp> {
  const ButtononBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      height: 30,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        onPressed: () {
          controller.next();
        },
        color: AppColors.darkYellow,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text("Continue",  style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
