import 'package:flutter/material.dart';
import 'package:gapp01/controller/home_controller.dart';
import 'package:gapp01/data/model/items_model.dart';
import 'package:get/get.dart';
import '../../../app_link.dart';

class ItemsHomeList extends GetView<HomeControllerImp> {
  const ItemsHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    print('kkkkkkkkkkkkkkkkk');
    return SizedBox(
      height: 135,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return ItemsHome(
                itemsmodel: ItemsModel.fromJson(controller.items[index]));
          }),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsmodel;
  const ItemsHome({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    print('pppp: $itemsmodel');
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            "${AppLink.itemsImages}/${itemsmodel.itemsImage}",
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.3),
          ),
          height: 120,
          width: 200,
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Text(itemsmodel.itemsName,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 19,
                  )),
        )
      ],
    );
  }
}
