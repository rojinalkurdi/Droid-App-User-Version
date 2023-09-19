import 'package:flutter/material.dart';
import 'package:gapp01/controller/home_controller.dart';
import 'package:gapp01/data/model/categories_model.dart';
import 'package:gapp01/view/widget/home/custom_text.dart';
import 'package:get/get.dart';
import '../../../app_link.dart';
import '../../../core/constant/colors.dart';

//extends GetView<controllerImp> to allow this class to access and use the controller.
class CategoriesHomeList extends GetView<HomeControllerImp> {
  const CategoriesHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
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

class Categories extends GetView<HomeControllerImp> {
  final int? i;
  final CategoriesModel categoriesmodel;
  const Categories({super.key, required this.categoriesmodel, required this.i});

  @override
  Widget build(BuildContext context) {
    //we'll wrap the culomn with InkWell to make it able to be pressed
    return InkWell(
      onTap: () {
        //goToItems function needs arguments (the categories and the selextedCategory)
        //to know which category is selected, from the listView of categories, each category in it
        //has got index
        //so we give the value of index from the list view to a variable like i.
        controller.goToItems(controller.categories, i!, categoriesmodel.categoriesId!.toInt());
      },
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  AppColors.secColor),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 70,
              width: 70,
              child: Image.network(
                "${AppLink.categoriesImages}/${categoriesmodel.categoriesImage}",
                color: AppColors.darkYellow,
              )),
          CustomText(text: "${categoriesmodel.categoriesName}"),
        ],
      ),
    );
  }
}
