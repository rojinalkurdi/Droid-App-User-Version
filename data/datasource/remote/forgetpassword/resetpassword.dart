import 'package:gapp01/app_link.dart';
import 'package:gapp01/core/class/crud.dart';

class ResetpasswordData{
  Crud crud;

  ResetpasswordData(this.crud);

  postdata(String email, String password) async {
    var response = await crud.postData(AppLink.resetpassword, {
      "email" : email,
      "password" : password
    });
   return response.fold((l) => l, (r) => r);
  }
}
