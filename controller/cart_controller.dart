import 'package:flutter/cupertino.dart';
import 'package:gapp01/core/class/statusRequest.dart';
import 'package:gapp01/core/constant/routes.dart';
import 'package:gapp01/core/services/my_services.dart';
import 'package:gapp01/data/datasource/remote/cart_data.dart';
import 'package:gapp01/data/model/cart_model.dart';
import 'package:gapp01/data/model/coupon_model.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';

class CartController extends GetxController {
  //making the instance from the class that get and send data from and to backend
  CartData cartdata = CartData(Get.find());
  MyServices myservices = Get.find();
  late StatusRequest statusrequest;
  List<CartModel> data = [];
  double ordersPrice = 0.0;
  int totalItemsCount = 0;
  TextEditingController? couponController;
  CouponModel? couponModel;
  int? discountCoupon = 0;
  String? couponName;
  int? couponid;

  add(int itemsid) async {
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

  delete(int itemsid) async {
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

  //the function that bring the data from backend(viewCart) is only called once when we intialize the page
  //but espacially in cart's page we need to call it after every adding or deleting process
  //HOW?
  //1. reset the values of totalItemsCount and ordersPrice
  //2. call the fuction that bring the data from backend (viewCart) again in a new function with the function that resets the values we want to refresh
  //3. call the refreshing function at the (onPressed: (){controller.refresh();})
  //sooo everytime you press on the button the function is being called again and the values will be refreshed not only on initial.
  resetValues() {
    totalItemsCount = 0;
    ordersPrice = 0.0;
    data.clear();
  }

  refreshPage() {
    resetValues();
    viewCart();
  }

  viewCart() async {
    statusrequest = StatusRequest.loading;
    update();
    var response =
        await cartdata.viewCart(myservices.sharedPreferences.getInt("id")!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == "success") {
          //response['datacart'] contains all data from cartView where cart_usersid = $usersid
          List responseData = response['datacart']['data'];
          //response['datacountprice'] contains the 2 columns of (total price and total count)
          Map responseDataCountPrice = response['countprice'];
          data.clear();
          data.addAll(responseData.map((e) => CartModel.fromJson(e)));
          totalItemsCount = responseDataCountPrice['totalcount'];
          // totalItemsCount = int.parse(responseDataCountPrice['totalcount']);
          ordersPrice = responseDataCountPrice['totalprice'];
        }
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkCoupon() async {
    statusrequest = StatusRequest.loading;
    update();
    var response = await cartdata.checkCoupon(couponController!.text);

    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        //here we recieved the data as a Json map called couponData
        //but if we want to use it for showing on ui
        //so we need to put it in a variable from its Type (CouponModel)
        Map<String, dynamic> couponData = response['data'];
        couponModel = CouponModel.fromJson(couponData);
        discountCoupon = int.parse(couponModel!.couponDiscount.toString());
        couponName = couponModel!.couponName;
        couponid = couponModel!.couponId!.toInt();
      } else {
        discountCoupon = 0;
        couponName = null;
        couponid = null;
        Get.snackbar("Warning!", "invalid coupon");
      }
    }
    update();
  }

  getTotalPrice() {
    return (ordersPrice - ordersPrice * discountCoupon! / 100);
  }

  goToCheckoutPage() {
    if (data.isEmpty) {
      return Get.snackbar("Warning!", "Your shopping cart is empty");
    }
    Get.toNamed(AppRoutes.checkout, arguments: {
      // ?? means NULL
      "couponid": couponid ?? 0,
      "ordersprice": ordersPrice,
      "discountcoupon": discountCoupon,
    });
  }

  @override
  void onInit() {
    couponController = TextEditingController();
    viewCart();
    super.onInit();
  }
}
