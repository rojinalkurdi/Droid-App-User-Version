import 'package:flutter/cupertino.dart';
import 'package:gapp01/core/class/statusRequest.dart';
import 'package:gapp01/core/constant/routes.dart';
import 'package:gapp01/core/services/my_services.dart';
import 'package:gapp01/data/datasource/remote/home_data.dart';
import 'package:gapp01/data/model/items_model.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';

abstract class HomeController extends SearchMixController {
  intialData();
  getdata();
  goToItems(List categories, int selectedCat, int categoryid);
}

class HomeControllerImp extends HomeController {
  MyServices myservices = Get.find();

  List categories = [];
  List items = [];

  String? username;
  String? email;
  int? id;

  @override
  intialData() {
    email = myservices.sharedPreferences.getString("email");
    username = myservices.sharedPreferences.getString("username");
    id = myservices.sharedPreferences.getInt("id");
  }

  @override
  getdata() async {
    statusrequest = StatusRequest.loading;
    var response = await homedata.getData();
    print('dd: ${response['items']}');
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        print('mm: $items');
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getdata();
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "categoryid": categoryid
    });
  }

  goToProductDetailsPage(itemsModel) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"itemsmodel": itemsModel});
  }
}

class SearchMixController extends GetxController {
  TextEditingController? search;
  bool isSearch = false;
  late StatusRequest statusrequest;
  List<ItemsModel> listdata = [];
  HomeData homedata = HomeData(Get.find());

  searchData() async {
    statusrequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    print('dd: ${response['items']}');
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responseData = response['data'];
        //responseData type is itemsModel.fromJson(e)
        //(e) means that it's dynamic
        listdata.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkSearch(val) {
    if (val == "") {
      statusrequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}
