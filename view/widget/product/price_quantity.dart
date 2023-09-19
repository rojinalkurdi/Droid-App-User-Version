import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';

class PriceAndQuantity extends StatelessWidget {
  final void Function() onAdd;
  final void Function() onRemove;
  final String price;
  final String  quantity;
  const PriceAndQuantity(
      {super.key, required this.onAdd, required this.onRemove, required this.price, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$price\$",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.darkYellow)),
        const Spacer(),
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
              margin: const EdgeInsets.only(right: 5, left: 5),
              child: Text(quantity, style: Theme.of(context).textTheme.displayLarge),
            ),
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.minimize_sharp),
              padding: const EdgeInsets.only(bottom: 11),
            )
          ],
        )
      ],
    );
  }
}
