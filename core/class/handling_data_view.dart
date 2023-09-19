import 'package:flutter/material.dart';
import 'package:gapp01/core/class/statusRequest.dart';
import 'package:gapp01/core/constant/colors.dart';
//import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusrequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusrequest == StatusRequest.loading
        ? const Center(child: Text("loading"))
         //Lottie.asset(onBoardingImages.loading))
        : statusrequest == StatusRequest.offlineFailure
            ? const Center(child: Text("offline"))
            //Lottie.asset(onBoardingImages.offline))
            : statusrequest == StatusRequest.serverFailure
                ? Center(child: Text("server connection failure", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.darkYellow, fontSize: 23),))
                //Lottie.asset(onBoardingImages.servererror))
                 : statusrequest == StatusRequest.failure
                ? const Center(child: Text("No Data"))
                : widget;
  }
}
