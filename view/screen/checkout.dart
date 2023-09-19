import 'package:flutter/material.dart';
import 'package:gapp01/controller/checkout_controller.dart';
import 'package:gapp01/core/class/handling_data_view.dart';
import 'package:gapp01/core/constant/routes.dart';
import 'package:gapp01/view/widget/cart/custom_cart_button.dart';
import 'package:gapp01/view/widget/checkout/shipping_address.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Checkout",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.white)),
        ),
        bottomNavigationBar: CustomButton(
            onPressed: () {
              controller.getCheckout();
            },
            text: "Checkout"),
        body: GetBuilder<CheckoutController>(
            builder: (controller) => HandlingDataView(
                statusrequest: controller.statusrequest,
                widget: Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 5, horizontal: 10),
                      //   child: Text("Choose a payment method",
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .displayLarge!
                      //           .copyWith(color: Colors.black)),
                      // ),
                      // const SizedBox(width: 10),
                      // InkWell(
                      //     onTap: () {
                      //       controller.choosePaymentMethod(0); //0:cach

                            //there should be a methodology to approve that
                            //the user payed through cach to don't pay through hand
                            //if you couldn't
                            //so make 0: for mtnCach , 1: for syriatelCach
                      //     },
                      //     child: PaymentMethod(
                      //         title: "Cash Mobile MTN",
                      //         isActive: controller.paymentMethod == 0
                      //             ? true
                      //             : false)),
                      // InkWell(
                      //     onTap: () {
                      //       controller.choosePaymentMethod(1); //1:inhand
                      //     },
                      //     child: PaymentMethod(
                      //         title: "Syriatel Cash",
                      //         isActive: controller.paymentMethod == 1
                      //             ? true
                      //             : false)),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 5, horizontal: 10),
                      //   child: Text("Choose a delivery method",
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .headline1!
                      //           .copyWith(color: Colors.black)),
                      // ),
                      // Row(
                      //   children: [
                      //     InkWell(
                      //       onTap: () {
                      //         controller.chooseDeliverytMethod(0);//0:motor
                      //       },
                      //       child: DeliveryMethod(
                      //           title: "Motor",
                      //           isActive: controller.deliveryType == 0
                      //               ? true
                      //               : false,
                      //           imagePath: onBoardingImages.motor),
                      //     ),
                      //     const SizedBox(
                      //       width: 10,
                      //     ),
                      //     InkWell(
                      //       onTap: () {
                      //         controller.chooseDeliverytMethod(1);//1:truck
                      //       },
                      //       child: DeliveryMethod(
                      //           title: "Truck",
                      //           isActive: controller.deliveryType == 1
                      //               ? true
                      //               : false,
                      //           imagePath: onBoardingImages.truck),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text("Choose your shipping address",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: Colors.black)),
                      ),
                      ...List.generate(
                          controller.addressdata.length,
                          (index) => InkWell(
                                onTap: () {
                                  controller.chooseAddressid(
                                      controller.addressdata[index].addressId!.toInt() as double);
                                },
                                child: ShippingAddress(
                                    isActive: controller.addressid ==
                                            controller
                                                .addressdata[index].addressId
                                        ? true
                                        : false,
                                    title:
                                        "${controller.addressdata[index].addressName}",
                                    subtitle:
                                        "${controller.addressdata[index].addressCity}"
                                        " , "
                                        "${controller.addressdata[index].addressStreet}"),
                              )),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text("Or add a new address",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: Colors.black)),
                      ),
                      const SizedBox(width: 10),
                      CustomButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.addressAdd);
                          },
                          text: "Add a new address"),
                    ],
                  ),
                ))));
  }
}
