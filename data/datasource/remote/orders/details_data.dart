import 'package:gapp01/app_link.dart';
import 'package:gapp01/core/class/crud.dart';

class OrdersDetailsData{
  Crud crud;

  OrdersDetailsData(this.crud);

  getData(int id) async {
    var response = await crud.postData(AppLink.ordersDetails, {
      "id" : id.toString()
    });
   return response.fold((l) => l, (r) => r);
  }
}
