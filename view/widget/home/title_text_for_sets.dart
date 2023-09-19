import 'package:flutter/material.dart';
import 'package:gapp01/core/constant/colors.dart';

class SetTitle extends StatelessWidget {
  final String title;
  const SetTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.darkYellow, fontSize: 23)),
    );
  }
}
