import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gapp01/controller/favorite_controller.dart';
import 'package:gapp01/controller/items_controller.dart';
import 'package:gapp01/core/constant/image.dart';
import 'package:gapp01/data/model/items_model.dart';
import 'package:get/get.dart';

import '../../../app_link.dart';
import '../../../core/constant/colors.dart';

class CustomItemsList extends GetView<ItemsControllerImp> {
  const CustomItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GridView.builder(
        //list.legth
        itemCount: controller.data.length,
        //to fitt with th whole content automatically
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        //here is the diffrence between gridView and listView
        //that you can specify how many items you want to show in each row
        //using crossAxisCount: 5 means that i want 5 items per row.
        //childAspectRatio to change the card's size
        //its default value is 1 eache time you minmize it you get a bigger card.
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: ((context, index) {
          controllerFav.isFavorite[controller.data[index]['items_id']] =
              controller.data[index]['favorite'];
          return ItemsList(
              itemsmodel: ItemsModel.fromJson(controller.data[index]));
        }));
  }
}

class ItemsList extends GetView<ItemsControllerImp> {

  final ItemsModel itemsmodel;
  //final bool active;
  const ItemsList({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToProductDetailsPage(itemsmodel);
        },
        child: Card(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "${itemsmodel.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.itemsImages}/${itemsmodel.itemsImage}",
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(itemsmodel.itemsName,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: Colors.black)),
                    // Padding(
                    //   padding: const EdgeInsets.all(10),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         "Rating 3.5",
                    //         style: Theme.of(context)
                    //             .textTheme
                    //             .displayLarge!
                    //             .copyWith(fontSize: 15),
                    //       ),
                    //       Row(
                    //         children: [
                    //           ...List.generate(
                    //               5,
                    //               (index) => const Icon(
                    //                     Icons.star_border_outlined,
                    //                     size: 15,
                    //                   ))
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ),
                    Row(
                      //spaceBetween:to put a space between row's childrens
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         if (itemsmodel.itemsDiscount == 0)
                        Text(
                          "${itemsmodel.itemsPrice}\$",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: AppColors.darkYellow),
                        ),
                         if (itemsmodel.itemsDiscount != 0)
                         Column(
                          children: [
                            Stack(
                              children: [Text(
                              "${itemsmodel.itemsPrice}\$",
                             style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: AppColors.grey),
                                ),
                            Positioned(
                              top: 11,
                              child: Container(
                                height: 2,
                                width: 100,
                                color: const Color.fromARGB(156, 244, 67, 54),
                              ),
                            )
                           ]),
                          Text(
                          "${itemsmodel.itemsDiscountedPrice}\$",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: AppColors.darkYellow),
                        ),

                          ],
                         ),
                        GetBuilder<FavoriteController>(
                            builder: (controller) => IconButton(
                                  onPressed: () {
                                    if (controller
                                            .isFavorite[itemsmodel.itemsId] ==
                                        "1") {
                                      controller.setFavorite(
                                          itemsmodel.itemsId, '0');
                                      controller
                                          .removeFavorite(itemsmodel.itemsId.toInt());
                                    } else {
                                      controller.setFavorite(
                                          itemsmodel.itemsId, '1');
                                      controller
                                          .addFavorite(itemsmodel.itemsId.toInt());
                                    }
                                  },
                                  icon: controller
                                              .isFavorite[itemsmodel.itemsId] ==
                                          "1"
                                      ? const Icon(Icons.favorite,
                                          color: Colors.red)
                                      : const Icon(
                                          Icons.favorite_border_outlined),
                                ))
                      ],
                    ),
                  ]),
            ),
            if (itemsmodel.itemsDiscount != 0)
              Positioned(
                  top: 5,
                  // left: 0,
                  child: CachedNetworkImage(
                    imageUrl: onBoardingImages.sale,
                    color: AppColors.darkYellow,
                    height: 70,
                  )),
            // Image.asset(onBoardingImages.sale),
          ]),
        ));
  }
}
