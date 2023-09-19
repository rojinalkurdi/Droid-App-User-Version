import 'package:gapp01/view/screen/address/add.dart';
import 'package:gapp01/view/screen/address/add_details.dart';
import 'package:gapp01/view/screen/address/view.dart';
import 'package:gapp01/view/screen/cart.dart';
import 'package:gapp01/view/screen/checkout.dart';
import 'package:gapp01/view/screen/forgetPwAuth/forget_pw.dart';
import 'package:gapp01/view/screen/forgetPwAuth/reset_pw.dart';
import 'package:gapp01/view/screen/forgetPwAuth/successreset_pw.dart';
import 'package:gapp01/view/screen/forgetPwAuth/verificationcode_pw.dart';
import 'package:gapp01/view/screen/auth/login.dart';
import 'package:gapp01/view/screen/auth/signup.dart';
import 'package:gapp01/view/screen/auth/signup_verification.dart';
import 'package:gapp01/view/screen/auth/success_signup.dart';
import 'package:gapp01/view/screen/home_screen.dart';
import 'package:gapp01/view/screen/items.dart';
import 'package:gapp01/view/screen/my_favorite.dart';
import 'package:gapp01/view/screen/on_boarding.dart';
import 'package:gapp01/view/screen/orders/archive.dart';
import 'package:gapp01/view/screen/orders/orders_details.dart';
import 'package:gapp01/view/screen/orders/pending.dart';
import 'package:gapp01/view/screen/product_details.dart';
import 'package:gapp01/view/screen/settings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:gapp01/core/constant/routes.dart';
import 'core/middleware/my_middleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const OnBoarding(), middlewares: [MyMiddleware()]),
  GetPage(name: AppRoutes.productDetails, page: () => const ProductDetails()),
  //GetPage(name: "/", page: () => const testDataView()),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUp, page: () => SignUp()),
  GetPage(name: AppRoutes.forgetPw, page: () => const ForgetPw()),
  GetPage(
      name: AppRoutes.varifactionCode, page: () => const VerificationCode()),
  GetPage(name: AppRoutes.resetPw, page: () => const ResetPw()),
  GetPage(name: AppRoutes.successResetPw, page: () => const SuccessResetPw()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoutes.signUpVerification,
      page: () => const SignUpVerification()),
  //home
  GetPage(name: AppRoutes.homePage, page:() => const HomeScreen()),
  GetPage(name: AppRoutes.items, page:() => const Items()),
  GetPage(name: AppRoutes.myfavorite, page:() => const MyFavorite()),
  GetPage(name: AppRoutes.settings, page:() => const Settings()),
  GetPage(name: AppRoutes.cart, page:() => const Cart()),
  GetPage(name: AppRoutes.addressView, page:() => const AddressView()),
  GetPage(name: AppRoutes.addressAdd, page:() => const AddressAdd()),
  GetPage(name: AppRoutes.addressDetails, page:() => const AddressDetails()),
  GetPage(name: AppRoutes.checkout, page:() => const Checkout()),
  GetPage(name: AppRoutes.pendingOrders, page:() => const PendingOrders()),
  GetPage(name: AppRoutes.ordersDetails, page:() => const OrdersDetails()),
  GetPage(name: AppRoutes.archivedOrders, page:() => const ArchivedOrders()),
];
