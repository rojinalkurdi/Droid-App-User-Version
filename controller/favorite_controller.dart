import 'package:gapp01/core/class/statusRequest.dart';
import 'package:gapp01/core/services/my_services.dart';
import 'package:gapp01/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';

class FavoriteController extends GetxController {
  //making the instance from the class that get and send data from and to backend
  FavoriteData favoriteData = FavoriteData(Get.find());
  List data = [];
  late StatusRequest statusrequest;
  MyServices myServices = Get.find();
  Map isFavorite = {};
  //the map (isFavorite) contains keys and values
  // the keys reffers to :item's id
  // the values reffers to : favorite's column val 0 or 1
  //when we open the items page we'll get the keys and values
  //so we'll create favController in items.dart and get the requierd values
  //________
  //seFavorite function is to reset favorite button status when we press the fav button.
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(int itemsid) async {
    data.clear();
    statusrequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        itemsid, myServices.sharedPreferences.getInt("id")!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite(int itemsid) async {
    data.clear();
    statusrequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        itemsid, myServices.sharedPreferences.getInt("id")!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
  }
}
