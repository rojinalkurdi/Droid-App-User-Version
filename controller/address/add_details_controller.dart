import 'package:flutter/material.dart';
import 'package:gapp01/core/class/statusRequest.dart';
import 'package:gapp01/core/constant/routes.dart';
import 'package:gapp01/core/services/my_services.dart';
import 'package:gapp01/data/datasource/remote/address_data.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata.dart';

//address controler part two is to get the lat and laong from the older address controler
class AddAddressDetailsController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();
  StatusRequest statusrequest = StatusRequest.none;
  String? lat;
  String? long;

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print(lat);
    print(long);
  }

  addAddress() async {
    statusrequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        myServices.sharedPreferences.getInt("id")!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.homePage);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
