import 'package:flutter/material.dart';
import 'package:gapp01/controller/myfavorite_controller.dart';
import 'package:gapp01/core/class/handling_data_view.dart';
import 'package:gapp01/view/widget/favorite/custom_favorite_items_list.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
        body: Container(
          margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            child: GetBuilder<MyFavoriteController>(
                builder: ((controller) => ListView(children: [
                    Text("My Favorite",
                            style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center,),
                      HandlingDataView(
                          statusrequest: controller.statusrequest,
                            widget: GridView.builder(
                                itemCount: controller.data.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.7),
                                itemBuilder: (context, index) {
                                  // return Text(controller.data[index]['items_name']);
                                  return CustomListFavoriteItems(
                                      itemsmodel: controller.data[index]);
                                }),
                          ),
                    ])))));
  }
}
