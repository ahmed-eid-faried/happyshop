import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/datasource/remote/address.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class AddAddressDetailsController extends GetxController {
  LatLng? latLng;
  Placemark? placemark;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? name;
  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  late String? userid;
  MyService myServices = Get.find();
  intialData() {
    city = TextEditingController();
    street = TextEditingController();
    name = TextEditingController();
    latLng = Get.arguments['latLng'];
    placemark = Get.arguments['placemark'];
    if (placemark != null) {
      city!.text = placemark!.locality!;
      street!.text = placemark!.street!;
      name!.text = placemark!.administrativeArea!;
    }

    update();
  }

  clearData() {
    city!.text = "";
    street!.text = "";
    name!.text = "";
    update();
  }

  Map isFavorite = {};

  addAdress() async {
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addAddress(
      userid!,
      name!.text,
      city!.text,
      street!.text,
      latLng!.latitude.toString(),
      latLng!.longitude.toString(),
    );
    print(response);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.addressview);
        clearData();
      } else {
        Get.defaultDialog(middleText: "please, try again with new values");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
