import 'package:flutter/material.dart';
import 'package:gapp01/controller/items_controller.dart';
import 'package:gapp01/core/class/handling_data_view.dart';
import 'package:gapp01/view/widget/home/custom_search_tff.dart';
import 'package:gapp01/view/widget/items/custom_items_list.dart';
import 'package:gapp01/view/widget/items/list_items_categories.dart';
import 'package:get/get.dart';

import 'home.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    Get.put(ItemsControllerImp());
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          SearchTextFormField(
            myController: controller.search!,
            onpressed: () {
              controller.onSearchItems();
            },
            onChanged: (val) {
              controller.checkSearch(val);
            },
          ),
          const SizedBox(height: 20),
          const CategoriesItemsList(),
          GetBuilder<ItemsControllerImp>(
              builder: ((controller) => HandlingDataView(
                    statusrequest: controller.statusrequest,
                    widget: !controller.isSearch?
                    const CustomItemsList()
                    : ListItemsSearch(listdataModel: controller.listdata),
                  )))
        ],
      ),
    ));
  }
}
