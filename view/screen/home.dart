import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gapp01/app_link.dart';
import 'package:gapp01/controller/home_controller.dart';
import 'package:gapp01/core/class/handling_data_view.dart';
import 'package:gapp01/data/model/items_model.dart';
import 'package:gapp01/view/widget/home/custom_card.dart';
import 'package:gapp01/view/widget/home/custom_search_tff.dart';
import 'package:gapp01/view/widget/home/list_home_categories.dart';
import 'package:gapp01/view/widget/home/list_home_items.dart';
import 'package:gapp01/view/widget/home/title_text_for_sets.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: ((controller) => HandlingDataView(
              statusrequest: controller.statusrequest,
              widget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(children: [
                  SearchTextFormField(
                    myController: controller.search!,
                    onpressed: () {
                      controller.onSearchItems();
                    },
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                  ),
                  !controller.isSearch
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AdvertsCard(
                                title: "Hello ${controller.username} !",
                                bodyText:
                                    "We hope you could find everything you want with Droid"),
                            const CategoriesHomeList(),
                            const SetTitle(title: "Products With Discount On"),
                            const ItemsHomeList(),
                            const SetTitle(title: "Recently added"),
                            const ItemsHomeList(),
                            const SetTitle(title: "Top Rated"),
                            const ItemsHomeList(),
                          ],
                        )
                      : ListItemsSearch(listdataModel: controller.listdata)
                ]),
              ),
            )));
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdataModel;
  const ListItemsSearch({super.key, required this.listdataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdataModel.length,
        //we're going to call this class in the above which also has got a ListView
        //ListView inside a ListView will cause a problem
        //to solve it: shrinkWrap: true, physics: neverScroll,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () {
              controller.goToProductDetailsPage(listdataModel[index]);
            },
            child: Container(
              margin: const EdgeInsets.all(7),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(7),
                  child: Row(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                              imageUrl:
                                  "${AppLink.itemsImages}/${listdataModel[index].itemsImage}",
                                  height: 80,)),
                      Expanded(
                        flex: 2,
                        child: ListTile(
                            title: Text(
                              listdataModel[index].itemsName,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(color: Colors.black),
                            ),
                            subtitle: Text(
                              listdataModel[index].categoriesName,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(color: Colors.grey, fontSize: 15),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
