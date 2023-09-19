import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gapp01/app_link.dart';
import '../../../core/constant/colors.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String image;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList(
      {super.key,
      required this.name,
      required this.price,
      required this.count,
      required this.image, required this.onAdd, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      child: Row(
        children: [
          //expanded is like the container but we use it for a better control on the sizes of childs
          //the difference between conteiner and expanded is that the whole container will be effected
          // the expanded only the child will be effected
          //the bigger flex's value the smaller the result will be.
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: "${AppLink.itemsImages}/$image",
                height: 80,
              )),
          Expanded(
              flex: 5,
              child: ListTile(
                title: Text(name,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: Colors.black)),
                subtitle: Text("$price\$",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: AppColors.darkYellow, fontSize: 17)),
              )),
          Expanded(
              child: Column(
            children: [
              IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
              Text(count, style: Theme.of(context).textTheme.displayLarge),
              IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
            ],
          )),
        ],
      ),
    );
  }
}
