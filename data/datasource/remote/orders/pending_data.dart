import 'package:gapp01/app_link.dart';
import 'package:gapp01/core/class/crud.dart';

class PendingOrdersData{
  Crud crud;

  PendingOrdersData(this.crud);

  getPendingData(int usersid) async {
    var response = await crud.postData(AppLink.pendingOrders, {
      "id" : usersid.toString(),
    });
   return response.fold((l) => l, (r) => r);
  }

  deleteOrderData(int orderid) async {
    var response = await crud.postData(AppLink.deleteOrder, {
      "id" : orderid.toString(),
    });
   return response.fold((l) => l, (r) => r);
  }
}
