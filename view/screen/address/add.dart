import 'package:flutter/material.dart';
import 'package:gapp01/controller/address/add_controller.dart';
import 'package:gapp01/core/class/handling_data_view.dart';
import 'package:gapp01/view/widget/cart/custom_cart_button.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Address",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.white)),
      ),
      body: Container(
          child: GetBuilder<AddAddressController>(
              builder: (controllerPage) => HandlingDataView(
                    statusrequest: controllerPage.statusrequest,
                    widget: Column(
                      children: [
                        // if (controllerPage.kGooglePlex != null)
                        Expanded(
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              GoogleMap(
                                //mapType: MapType.hybrid,
                                mapType: MapType.normal,
                                markers: controllerPage.markers.toSet(),
                                onTap: (latlong) {
                                   controllerPage.addMarkers(latlong);
                                 
                                },
                                initialCameraPosition:
                                    controllerPage.kGooglePlex,
                                onMapCreated:
                                    (GoogleMapController controllerMap) {
                                  controllerPage.completerController!
                                      .complete(controllerMap);
                                },
                              ),
                              Positioned(
                                  // bottom: 10,
                                  child: Container(
                                      child: CustomButton(
                                          onPressed: () {
                                            controllerPage.goToAddressDetails();
                                          },
                                          text: "Tap to continue")))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))),
    );
  }
}
