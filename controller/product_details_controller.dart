import 'package:flutter/material.dart';
import 'package:gapp01/core/class/statusRequest.dart';
import 'package:gapp01/core/services/my_services.dart';
import 'package:gapp01/data/datasource/remote/cart_data.dart';
import 'package:gapp01/data/model/items_model.dart';
import 'package:get/get.dart';
import '../core/functions/handlingdata.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  //we injected the cartController in the productController to get all the information here
//  CartController cartcontroller = Get.put(CartController());
  MyServices myservices = Get.find();
  CartData cartdata = CartData(Get.find());
  late ItemsModel itemsModel;
  late StatusRequest statusrequest;
  int itemsCount = 0;

  initialData() async {
    statusrequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    itemsCount = await getItemsCount(itemsModel.itemsId.toInt());
    statusrequest = StatusRequest.success;
    update();
  }

  List subitems = [
    {"name": "red", "id": 1, "active": "0", "color": Colors.red},
    {"name": "blue", "id": 2, "active": "0", "color": Colors.blue},
    {"name": "green", "id": 3, "active": "1", "color": Colors.green},
  ];

  additems(int itemsid) async {
    statusrequest = StatusRequest.loading;
    update();
    var response = await cartdata.addCart(
        itemsid, myservices.sharedPreferences.getInt("id")!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteitems(int itemsid) async {
    statusrequest = StatusRequest.loading;
    update();
    var response = await cartdata.deleteCart(
        itemsid, myservices.sharedPreferences.getInt("id")!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  add() {
    //adding in backend
    additems(itemsModel.itemsId.toInt());
    itemsCount++;
    update();
  }

  remove() {
    if (itemsCount > 0) {
    deleteitems(itemsModel.itemsId.toInt());
      itemsCount--;
      update();
    }
  }

  
  getItemsCount(int itemsid) async {
    statusrequest = StatusRequest.loading;
    var response = await cartdata.getitemsCart(
        itemsid, myservices.sharedPreferences.getInt("id")!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        int itemsCount = 0;
        itemsCount = response['data'];
        return itemsCount;
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
