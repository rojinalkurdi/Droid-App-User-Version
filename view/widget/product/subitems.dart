import 'package:flutter/material.dart';
import 'package:gapp01/controller/product_details_controller.dart';
import 'package:get/get.dart';

class SubitemsList extends GetView<ProductDetailsControllerImp> {
  const SubitemsList ({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  children: [
                    ...List.generate(
                      controller.subitems.length, 
                    (index) => 
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: controller.subitems[index]["color"],
                            border: Border.all(color: controller.subitems[index]["active"] == "1"? Colors.black : Colors.transparent,  width: 2.5, strokeAlign: BorderSide.strokeAlignCenter),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      //  Text(controller.subitems[index]["name"])
                      ],
                    ),
                 ) ],
                );
  }
}