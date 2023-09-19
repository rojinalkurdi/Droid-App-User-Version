import 'package:gapp01/core/class/statusRequest.dart';
import 'package:gapp01/core/constant/routes.dart';
import 'package:gapp01/core/services/my_services.dart';
import 'package:gapp01/data/datasource/remote/address_data.dart';
import 'package:gapp01/data/datasource/remote/checkout_data.dart';
import 'package:gapp01/data/model/address_model.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = CheckoutData(Get.find());
  MyServices myServices = Get.find();
  List<AddressModel> addressdata = [];
  StatusRequest statusrequest = StatusRequest.none;
  //double? paymentMethod;
  double? deliveryType;
  double? addressid;
  late double couponid;
  late double ordersPrice;
  late double discountCoupon;

  // choosePaymentMethod(double val) {
  //   paymentMethod = val;
  //   update();
  // }

  // chooseDeliverytMethod(double val) {
  //   deliveryType = val;
  //   update();
  // }

  chooseAddressid(double val) {
    addressid = val;
    update();
  }

  getAddressData() async {
    statusrequest = StatusRequest.loading;
    update();
    var response =
        await addressData.getData(myServices.sharedPreferences.getInt("id")!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        addressdata.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCheckout() async {
    // if (paymentMethod == null) {
    //   return Get.snackbar("Error", "Please select a paymentMethod");
    // }
    // if (deliveryType == null) {
    //   return Get.snackbar("Error", "Please select a delivery type");
    // }
    if (addressid == null) {
      return Get.snackbar("Error", "Please select an address");
    }

    // Map data = {
    //   "usersid": myServices.sharedPreferences.getdouble("id"),
    //   "addressid": addressid.toString(),
    //   "type": deliveryType.toString(),
    //   "deliveryprice": '10',
    //   "ordersprice": ordersPrice.toString(),
    //   "couponid": couponid.toString(),
    //   "paymentmethod": paymentMethod.toString(),
    // };

    statusrequest = StatusRequest.loading;
    var response = await checkoutData.getCheckout(
        myServices.sharedPreferences.getDouble("id")!,
        addressid!,
       // deliveryType!,
        10,
        ordersPrice,
        couponid,
        discountCoupon
       // paymentMethod!
        );
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.homePage);
        Get.snackbar(
            "Congratulations!", "Your order has been registered successfully");
      } else {
        statusrequest = StatusRequest.none;
        Get.snackbar("Sorry!", "Please try again later");
      }
    }
    update();
  }
  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    ordersPrice = Get.arguments['ordersprice'];
    discountCoupon = Get.arguments['discountcoupon'];
    getAddressData();
    super.onInit();
  }
}
