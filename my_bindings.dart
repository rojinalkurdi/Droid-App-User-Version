import 'package:gapp01/controller/auth/login_controller.dart';
import 'package:gapp01/controller/forgetpassword/resetpw_controller.dart';
import 'package:gapp01/controller/auth/signup_verification_controller.dart';
import 'package:gapp01/controller/forgetpassword/verificationcode_controller.dart';
import 'package:get/get.dart';
import 'controller/auth/signup_controller.dart';
import 'controller/forgetpassword/forgetpw_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.lazyPut(() => LoginControllerImp(), fenix: true);
    Get.lazyPut(() => ForgetPwControllerImp(), fenix: true);
    Get.lazyPut(() => ResetPwControllerImp(), fenix: true);
    Get.lazyPut(() => SignUpVerificationControllerImp(), fenix: true);
    Get.lazyPut(() => VerificationCodeControllerImp(), fenix: true);
    
  }
}
