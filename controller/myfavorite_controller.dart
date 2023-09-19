import 'package:gapp01/core/class/statusRequest.dart';
import 'package:gapp01/core/services/my_services.dart';
import 'package:gapp01/data/datasource/remote/myfavorite_data.dart';
import 'package:gapp01/data/model/myfavorite_model.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData myfavoriteData = MyFavoriteData(Get.find());
  List<MyFavoriteModel> data = [];
  late StatusRequest statusrequest;
  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusrequest = StatusRequest.loading;
    var response = await myfavoriteData
        .getData(myServices.sharedPreferences.getInt("id")!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        //in the back, the fuction (getAllData) we used it in another way
        //we passed data through (values) parameter so it will come as a _jsonMap
        //so when we want to get it in front we code like this
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(int favoriteid) {
     myfavoriteData.deleteData(favoriteid);
     data.removeWhere((element) => element.favoriteId == favoriteid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
