import 'package:gapp01/app_link.dart';
import 'package:gapp01/core/class/crud.dart';

class ArchivedOrdersData{
  Crud crud;

  ArchivedOrdersData(this.crud);

  getarchivedData(int usersid) async {
    var response = await crud.postData(AppLink.archivedOrders, {
      "id" : usersid.toString(),
    });
   return response.fold((l) => l, (r) => r);
  }


}
