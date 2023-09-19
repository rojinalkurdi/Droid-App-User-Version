import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(color: Colors.black, fontSize: 13));
  }
}
