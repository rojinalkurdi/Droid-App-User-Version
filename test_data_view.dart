import 'package:flutter/material.dart';
import 'package:gapp01/controller/test_data_controller.dart';
import 'package:gapp01/core/constant/colors.dart';
import 'package:get/get.dart';

import 'core/class/handling_data_view.dart';

class TestDataView extends StatelessWidget {
  const TestDataView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(const TestDataView());
    return Scaffold(
      appBar: AppBar(
        title: const Text("test data view"),
        backgroundColor: AppColors.darkYellow,
      ),
      body: GetBuilder<TestDatacontroller>(builder: (controller) {
        return HandlingDataView(
            statusrequest: controller.statusrequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Text("${controller.data}");
                }));
      }),
    );
  }
}
