import 'package:flutter/cupertino.dart';
import 'package:gapp01/view/screen/cart.dart';
import 'package:gapp01/view/screen/home.dart';
import 'package:gapp01/view/screen/my_favorite.dart';
import 'package:gapp01/view/screen/orders/pending.dart';
import 'package:gapp01/view/screen/settings.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> pagesList = [
    const HomePage(),
    const MyFavorite(),
    const Cart(),
    const Settings(),
    const PendingOrders()
  ];

  List pagesNames = [
    "Home",
    "Favorites",
    "Basket",
    "Settings",
    "Profile",
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
