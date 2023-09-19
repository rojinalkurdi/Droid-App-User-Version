import 'package:flutter/material.dart';
import 'package:gapp01/controller/homescreen_controller.dart';
import 'package:gapp01/view/widget/home/custom_button_appbar.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: BottomAppBar(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //if we have a repeated widgets
                  //we better repeate them by using ...listgenerator(numberOfWidgets, context => ....)

                  // ...List.generate(
                  //     controller.pagesList.length,
                  //     ((index) => CustomButtonAppBar(
                  //         onpressed: () {
                  //           controller.changePage(index);
                  //         },
                  //         icon: Icons.home,
                  //         title: "${controller.pagesNames[index]}",
                  //         active: controller.currentpage == index ? true : false)))

                  CustomButtonAppBar(
                      onpressed: () {
                        controller.changePage(0);
                      },
                      icon: Icons.home,
                      title: "Home",
                      active: controller.currentpage == 0 ? true : false),
                  CustomButtonAppBar(
                      onpressed: () {
                        controller.changePage(1);
                      },
                      icon: Icons.favorite,
                      title: "Favorite",
                      active: controller.currentpage == 1 ? true : false),
                  CustomButtonAppBar(
                      onpressed: () {
                        controller.changePage(2);
                      },
                      icon: Icons.shopping_bag_outlined,
                      title: "Cart",
                      active: controller.currentpage == 2 ? true : false),
                  CustomButtonAppBar(
                      onpressed: () {
                       controller.changePage(3);
                       // Get.toNamed(AppRoutes.cart);
                      },
                      icon: Icons.settings,
                      title: "Settings",
                      active: controller.currentpage == 3 ? true : false),
                  CustomButtonAppBar(
                      onpressed: () {
                        controller.changePage(4);
                      },
                      icon: Icons.open_in_new_outlined,
                      title: "Orders",
                      active: controller.currentpage == 4 ? true : false),
                ],
              )),
              body: controller.pagesList.elementAt(controller.currentpage),
            ));
  }
}
