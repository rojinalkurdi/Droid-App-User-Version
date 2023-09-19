import 'package:flutter/material.dart';
import 'package:gapp01/controller/address/add_details_controller.dart';
import 'package:gapp01/core/class/handling_data_view.dart';
import 'package:gapp01/view/widget/auth/text_form_field.dart';
import 'package:gapp01/view/widget/cart/custom_cart_button.dart';
import 'package:get/get.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});
  @override
  Widget build(BuildContext context) {
        Get.put(AddAddressDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Address Details",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.white)),
        ),
        body: Container(
            padding: const EdgeInsets.all(15),
            child: GetBuilder<AddAddressDetailsController>(
                builder: (controller) => HandlingDataView(
                      statusrequest: controller.statusrequest,
                      widget: ListView(
                        children: [
                          CustomTextFormField(
                              hintText: "Address name",
                              labelText: "Address name",
                              icons: Icons.near_me,
                              myController: controller.name!,
                              valid: (val) {
                                return null;
                              },
                              isNumber: false),
                          CustomTextFormField(
                              hintText: "City",
                              labelText: "City",
                              icons: Icons.location_city_outlined,
                              myController: controller.city!,
                              valid: (val) {
                                return null;
                              },
                              isNumber: false),
                          CustomTextFormField(
                              hintText: "Street",
                              labelText: "Street",
                              icons: Icons.streetview,
                              myController: controller.street!,
                              valid: (val) {
                                return null;
                              },
                              isNumber: false),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomButton(
                              onPressed: () {
                                controller.addAddress();
                              },
                              text: "Save")
                        ],
                      ),
                    ))));
  }
}
