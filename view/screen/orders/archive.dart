import 'package:flutter/material.dart';
import 'package:gapp01/controller/orders/archive_controller.dart';
import 'package:gapp01/core/class/handling_data_view.dart';
import 'package:gapp01/core/class/statusRequest.dart';
import 'package:gapp01/core/constant/colors.dart';
import 'package:gapp01/data/model/orders_model.dart';
import 'package:get/get.dart';

class ArchivedOrders extends StatelessWidget {
  const ArchivedOrders({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(ArchivedOrdersController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Archived Orders",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.white)),
        ),
        body: Container(
            margin: const EdgeInsets.all(10),
            child: HandlingDataView(
              statusrequest: StatusRequest.none,
              widget: GetBuilder<ArchivedOrdersController>(
                  builder: (controller) => ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: ((context, index) => ArchivedOrdersListCard(
                            listdata: controller.data[index],
                          )))),
            )));
  }
}

class ArchivedOrdersListCard extends GetView<ArchivedOrdersController> {
  final OrdersModel listdata;
  const ArchivedOrdersListCard({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order id : ${listdata.ordersId}",
              style:
                  Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 17),
            ),
            const Divider(),
            // Text(
            //   "Order delivery type : ${controller.printOrderDeliveryType(listdata.ordersType!)} ",
            //   style:
            //       Theme.of(context).textTheme.headline1!.copyWith(fontSize: 15),
            // ),
            Text(
              "Order price : ${listdata.ordersPrice} \$ ",
              style:
                  Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15),
            ),
            Text(
              "Order delivery price : ${listdata.ordersDeliveryPrice} \$ ",
              style:
                  Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15),
            ),
            // Text(
            //   "Order payment method :${controller.printPaymentMethod(listdata.ordersPaymentMethod!)} ",
            //   style:
            //       Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15),
            // ),
            Text(
              "Order status :${controller.printOrderStatus(listdata.ordersStatus!.toInt())} ",
              style:
                  Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15),
            ),
            const Divider(),
             Text("Total price : ${listdata.ordersTotalPrice} \$",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 20, color: AppColors.darkYellow)),
            // Row(
            //   children: [
                 
            //     CustomButton(
            //         onPressed: () {
            //           Get.toNamed(AppRoutes.ordersDetails,
            //               arguments: {"ordersDetails": listdata});
            //         },
            //         text: "More Details"),
               
               
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
