import 'package:flutter/material.dart';
import 'package:gapp01/controller/items_controller.dart';
import 'package:gapp01/data/model/categories_model.dart';
import 'package:gapp01/view/widget/home/custom_text.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';

//extends GetView<controllerImp> to allow this class toaccess and use the controller.
class CategoriesItemsList extends GetView<ItemsControllerImp> {
  const CategoriesItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              //svg are loaded as code rather than images
              //so you won't face copy rights issues
              //with higher quality than jpg or png
              return Categories(
                categoriesmodel:
                    CategoriesModel.fromJson(controller.categories[index]),
                i: index,
              );
            }));
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final int? i;
  final CategoriesModel categoriesmodel;
  const Categories({super.key, required this.categoriesmodel, required this.i});

  @override
  Widget build(BuildContext context) {
    //we'll wrap the culomn with InkWell to make it able to be pressed
    return InkWell(
      onTap: () {
        controller.changeCat(i!, categoriesmodel.categoriesId!.toInt());
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(builder: (controller)=>
          Container(
              padding: const EdgeInsets.only(right: 10 , left: 10 , bottom: 5),
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3, color: AppColors.darkYellow)))
                  : null,
              child: CustomText(text: "${categoriesmodel.categoriesName}")),)
        ],
      ),
    );
  }
}
