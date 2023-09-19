import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gapp01/core/constant/colors.dart';


class DeliveryMethod extends StatelessWidget {
  final String title;
  final bool isActive;
  final String imagePath;
  
  const DeliveryMethod({super.key, required this.title, required this.isActive, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: isActive? AppColors.darkYellow : AppColors.secColor,
        //border: Border.all(color: AppColors.darkYellow),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        CachedNetworkImage(imageUrl: imagePath, color: Colors.white, width: 60,),
        Text(title, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, color:  Colors.white),)
      ],),
    );
  }
}
