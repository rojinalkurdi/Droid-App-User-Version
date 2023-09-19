import 'package:flutter/material.dart';
import 'package:gapp01/controller/cart_controller.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';
import 'custom_cart_button.dart';

class CustomBottomNavigationBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final String shipping;
  final String totalPrice;
 // final TextEditingController couponController;
  final void Function()? onApplyCoupon;

  const CustomBottomNavigationBarCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.totalPrice,
     // required this.couponController,
      this.onApplyCoupon,
      required this.shipping});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      GetBuilder<CartController>(
          builder: (controller) =>
          // controller.couponName == null
              //?
               //Container(
                 // margin: const EdgeInsets.only(left: 5, right: 5),
               //   padding: const EdgeInsets.all(5),
                //  child: Row(
                  //  children: [
                      // Expanded(
                      //     flex: 2,
                      //     child: TextFormField(
                      //       controller: couponController,
                      //       decoration: const InputDecoration(
                      //         //isDense: true,
                      //         contentPadding: EdgeInsets.symmetric(
                      //             horizontal: 5, vertical: 5),
                      //         border: OutlineInputBorder(),
                      //         hintText: "Enter Coupon",
                      //       ),
                      //     )),
                     // const SizedBox(width: 5),
                      // Expanded(
                      //     flex: 1,
                      //     child: CustomButton(
                      //         onPressed: onApplyCoupon, text: "Apply"))
                 //   ],
                 // ),
               // )
              // : Text(
              //     "${controller.couponName}'s coupon has been applied successfully",
              //     style: Theme.of(context)
              //         .textTheme
              //         .displayLarge!
              //         .copyWith(color: AppColors.darkYellow, fontSize: 17)
              //         )
                     // ),
      Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.darkYellow, width: 2)),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 15)),
                  Text("$price\$",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 15)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Discount",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 15)),
                  Text("$discount%",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 15)),
                ],
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.all(5),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text("Shipping",
            //           style: Theme.of(context)
            //               .textTheme
            //               .headline1!
            //               .copyWith(fontSize: 15)),
            //       Text("$shipping\$",
            //           style: Theme.of(context)
            //               .textTheme
            //               .headline1!
            //               .copyWith(fontSize: 15)),
            //     ],
            //   ),
            // ),
            const Divider(
              color: AppColors.grey,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total price",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 15, color: AppColors.darkYellow)),
                  Text("$totalPrice\$",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 15, color: AppColors.darkYellow)),
                ],
              ),
            ),
            const SizedBox(height: 5),
            CustomButton(
              onPressed: () {
                // Get.toNamed(AppRoutes.checkout);
                controller.goToCheckoutPage();
              },
              text: 'Order',
            )
          ]))
    )]);
  }
}
