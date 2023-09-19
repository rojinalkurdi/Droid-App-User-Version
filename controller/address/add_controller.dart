import 'dart:async';

import 'package:gapp01/core/class/statusRequest.dart';
import 'package:gapp01/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  List<Marker> markers = [];
  double? lat;
  double? long;

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  goToAddressDetails() {
    Get.toNamed(AppRoutes.addressDetails, arguments: {
      "lat": lat.toString(),
      "long": long.toString(),
    });
  }

  StatusRequest statusrequest = StatusRequest.none;
  Completer<GoogleMapController>? completerController =
      Completer<GoogleMapController>();

  //(37.42, -122.08) are the default latitude and longitude
  //emulater won't take us to the real current position

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // ignore: unused_field
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void onInit() {
    completerController = Completer<GoogleMapController>();
    super.onInit();
  }
}
