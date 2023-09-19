import 'package:flutter/material.dart';
import 'package:gapp01/core/constant/colors.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../data/datasource/static/static.dart';

class Dots extends StatelessWidget {
  const Dots({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.all(10),
                    duration: const Duration(milliseconds: 900),
                    width: controller.currentPage == index ? 19 : 11,
                    height: 9,
                    decoration: BoxDecoration(
                      color: controller.currentPage == index
                          ? AppColors.darkYellow
                          : AppColors.secColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ))
        ],
      ),
    );
  }
}
