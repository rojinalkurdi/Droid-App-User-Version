import 'package:flutter/material.dart';
import 'package:gapp01/core/constant/colors.dart';

class PaymentMethod extends StatelessWidget {
  final String title;
  final bool isActive;
  const PaymentMethod({super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding:  const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isActive == true ? AppColors.darkYellow : AppColors.secColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Text(title, style: Theme.of(context).textTheme.displayLarge!.copyWith(color:isActive? Colors.white: AppColors.darkYellow ),),
    );
  }
}