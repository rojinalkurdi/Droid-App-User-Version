import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gapp01/controller/myfavorite_controller.dart';
import 'package:gapp01/data/model/myfavorite_model.dart';
import 'package:get/get.dart';
import '../../../app_link.dart';
import '../../../core/constant/colors.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsmodel;
  //final bool active;
  const CustomListFavoriteItems({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          //controller.goToProductDetailsPage(itemsmodel);
        },
        child: Card(
          child: Padding(
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
                  Text("${itemsmodel.itemsName}",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rating 3.5",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 15),
                        ),
                        Row(
                          children: [
                            ...List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star_border_outlined,
                                      size: 15,
                                    ))
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    //spaceBetween:to put a space between row's childrens
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemsmodel.itemsPrice}\$",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: AppColors.darkYellow),
                      ),
                      IconButton(
                          onPressed: () {
                            controller.delete(itemsmodel.favoriteId!.toInt());
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                            color: AppColors.darkYellow,
                          ))
                      // GetBuilder<FavoriteController>(
                      //     builder: (controller) => IconButton(
                      //           onPressed: () {
                      //             if (controller
                      //                     .isFavorite[itemsmodel.itemsId] ==
                      //                 "1") {
                      //               controller.setFavorite(
                      //                   itemsmodel.itemsId, '0');
                      //               controller
                      //                   .removeFavorite(itemsmodel.itemsId);
                      //             } else {
                      //               controller.setFavorite(
                      //                   itemsmodel.itemsId, '1');
                      //               controller.addFavorite(itemsmodel.itemsId);
                      //             }
                      //           },
                      //           icon: controller
                      //                       .isFavorite[itemsmodel.itemsId] ==
                      //                   "1"
                      //               ? const Icon(Icons.favorite, color: Colors.red)
                      //               : const Icon(Icons.favorite_border_outlined),
                      //         ))
                    ],
                  ),
                ]),
          ),
        ));
  }
}
