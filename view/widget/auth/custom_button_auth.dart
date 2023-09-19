import 'package:flutter/material.dart';
import 'package:gapp01/core/constant/colors.dart';

class ButtonAuth extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;
  const ButtonAuth({super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 17),
        onPressed: onPressed,
        color: AppColors.darkYellow,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(textButton,  style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
