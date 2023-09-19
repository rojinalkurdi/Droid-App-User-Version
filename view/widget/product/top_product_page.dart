import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:gapp01/controller/product_details_controller.dart';
import 'package:get/get.dart';
import '../../../app_link.dart';

class TopProductPage extends GetView<ProductDetailsControllerImp> {
  const TopProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Hero(
              tag: "${controller.itemsModel.itemsId}",
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLink.itemsImages}/${controller.itemsModel.itemsImage}",
                height: 250,
                fit: BoxFit.fill,
              ),
            );
  }
}