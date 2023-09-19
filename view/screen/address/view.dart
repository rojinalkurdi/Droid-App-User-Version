import 'package:flutter/material.dart';
import 'package:gapp01/controller/address/view_controller.dart';
import 'package:gapp01/core/class/handling_data_view.dart';
import 'package:gapp01/core/constant/routes.dart';
import 'package:gapp01/data/model/address_model.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(AddressViewController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Address",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.white)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.addressAdd);
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          child: GetBuilder<AddressViewController>(
            builder: (controller) => HandlingDataView(
                statusrequest: controller.statusrequest,
                widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return AddressCard(
                        addressModel: controller.data[index],
                        onDelete: () {
                          controller
                              .deleteAddress(controller.data[index].addressId!.toInt());
                        },
                      );
                    })),
          ),
        ));
  }
}

class AddressCard extends StatelessWidget {
  final void Function()? onDelete;
  final AddressModel addressModel;
  const AddressCard({
    super.key,
    required this.addressModel,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(15),
          child: ListTile(
            title: Text(addressModel.addressName!),
            subtitle: Text("${addressModel.addressCity!}"
                ","
                "${addressModel.addressStreet}"),
            trailing: IconButton(
                onPressed: onDelete, icon: const Icon(Icons.delete_outline)),
          )),
    );
  }
}
