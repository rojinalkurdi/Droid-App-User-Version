import 'package:flutter/material.dart';
import 'package:gapp01/controller/cart_controller.dart';
import 'package:gapp01/core/class/handling_data_view.dart';
import 'package:gapp01/view/widget/cart/custom_bottom_navigation_cart.dart';
import 'package:gapp01/view/widget/cart/custom_items_cart_list.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartcontroller = Get.put(CartController());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => CustomBottomNavigationBarCart(
                  price: "${cartcontroller.ordersPrice}",
                  discount: "${controller.discountCoupon}",
                  shipping: "0",
                  totalPrice: "${controller.getTotalPrice()}",
                 // couponController: controller.couponController!,
                  onApplyCoupon: () {
                    controller.checkCoupon();
                  },
                )),
        body: GetBuilder<CartController>(
            builder: (controller) => HandlingDataView(
                statusrequest: controller.statusrequest,
                widget: Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      Center(
                        child: Text("Shopping Cart",
                            style: Theme.of(context).textTheme.displayLarge),
                      ),
                      ...List.generate(
                          cartcontroller.data.length,
                          (index) => CustomItemsCartList(
                                name: "${cartcontroller.data[index].itemsName}",
                                price:
                                    "${cartcontroller.data[index].itemsprice}",
                                count:
                                    "${cartcontroller.data[index].countitems}",
                                image:
                                    "${cartcontroller.data[index].itemsImage}",
                                onAdd: () async {
                                  await cartcontroller
                                      .add(cartcontroller.data[index].itemsId!.toInt());
                                  cartcontroller.refreshPage();
                                },
                                onRemove: () async {
                                  await cartcontroller.delete(
                                      cartcontroller.data[index].itemsId!.toInt());
                                  cartcontroller.refreshPage();
                                },
                              ))
                    ],
                  ),
                ))));
  }
}
