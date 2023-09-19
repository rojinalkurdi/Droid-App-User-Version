import 'package:gapp01/core/class/statusRequest.dart';
import 'package:gapp01/core/services/my_services.dart';
import 'package:gapp01/data/datasource/remote/address_data.dart';
import 'package:gapp01/data/model/address_model.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata.dart';

class AddressViewController extends GetxController {
  List<AddressModel> data = [];
  StatusRequest statusrequest = StatusRequest.none;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  deleteAddress(int addressid) {
    addressData.deleteData(addressid);
    //remove from data list the element from its column
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  getData() async {
    statusrequest = StatusRequest.loading;
    var response =
        await addressData.getData(myServices.sharedPreferences.getInt("id")!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusrequest = StatusRequest.failure;
        }
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
