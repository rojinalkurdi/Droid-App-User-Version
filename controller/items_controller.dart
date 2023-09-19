import 'package:flutter/cupertino.dart';
import 'package:gapp01/controller/home_controller.dart';
import 'package:gapp01/core/constant/routes.dart';
import 'package:gapp01/core/services/my_services.dart';
import 'package:gapp01/data/datasource/remote/items_data.dart';
import 'package:gapp01/data/model/items_model.dart';
import 'package:get/get.dart';
import '../core/class/statusRequest.dart';
import '../core/functions/handlingdata.dart';

abstract class ItemsController extends SearchMixController {
  initialData();
  changeCat(int val, int catval);
  getItems(int categoryid);
  goToProductDetailsPage(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCat;
  late int categoryid;
  ItemsData itemsdata = ItemsData(Get.find());
  MyServices myServices = Get.find();
  List data = [];

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    categoryid = Get.arguments['categoryid'];
    getItems(categoryid);
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    categoryid = catval;
    //we called getItems here to get the new items eache time we change the category (refresh)
    getItems(categoryid);
    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusrequest = StatusRequest.loading;
    var response = await itemsdata.getData(
        categoryid, myServices.sharedPreferences.getInt("id")!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    super.onInit();
  }

  @override
  goToProductDetailsPage(itemsModel) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"itemsmodel": itemsModel});
  }
}
