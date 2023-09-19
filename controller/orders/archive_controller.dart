import 'package:gapp01/core/class/statusRequest.dart';
import 'package:gapp01/data/datasource/remote/orders/archived_data.dart';
import 'package:gapp01/data/model/orders_model.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata.dart';
import '../../core/services/my_services.dart';

class ArchivedOrdersController extends GetxController {
  ArchivedOrdersData archiveddata = ArchivedOrdersData(Get.find());
  MyServices myServices = Get.find();
  List<OrdersModel> data = [];
  late StatusRequest statusrequest;

  // printPaymentMethod(int val) {
  //   if (val == 0) {
  //     return "Cach MTN";
  //   } else {
  //     return "Cach Syriatel";
  //   }
  // }

  printOrderStatus(int val) {
    if (val == 0) {
      return "Processing...";
    } else if (val == 1) {
      return "Preparing";
    } else if (val == 2) {
      return "on the way";
      } else if(val == 3) {
      return "ready to be piched up by delivery man";
    }
      else {
      return "Archived";
    }
  }

  getOrders() async {
    data.clear();
    statusrequest = StatusRequest.loading;
    var response = await archiveddata.getarchivedData(myServices.sharedPreferences.getInt("id")!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
        // data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrders() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
