import 'package:flutter/material.dart';
import 'package:gapp01/core/constant/colors.dart';

class ShippingAddress extends StatelessWidget {
  final bool isActive;
  final String title;
  final String subtitle;
  const ShippingAddress({super.key, required this.isActive, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive == true? AppColors.darkYellow : AppColors.secColor ,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(title , style: Theme.of(context).textTheme.displayLarge!.copyWith(color:isActive? Colors.white : AppColors.darkYellow)),
        subtitle: Text(subtitle, style: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }
}
