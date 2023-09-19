import 'package:gapp01/app_link.dart';
import 'package:gapp01/core/class/crud.dart';

class SignupVerifyCodeData {
  Crud crud;

  SignupVerifyCodeData(this.crud);

  postdata(String email , String verifycode) async {
    var response = await crud.postData(AppLink.verifycode, {
      "email" : email,
      "verifycode" : verifycode,
     
    });
   return response.fold((l) => l, (r) => r);
  }
}
