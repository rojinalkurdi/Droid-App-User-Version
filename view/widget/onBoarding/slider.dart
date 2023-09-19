import 'package:flutter/material.dart';
import 'package:gapp01/data/datasource/static/static.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';

class pageView extends GetView<OnBoardingControllerImp> {
  const pageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onChangedPage(value);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(onBoardingList[i].title!,
                    style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  onBoardingList[i].image!,
                  width: 245,
                  height: 250,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                )
              ],
            ));
  }
}
