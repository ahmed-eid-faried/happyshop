import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/data/datasource/remote/address.dart';
import 'package:happyshop/data/model/address_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressEditController extends GetxController {
  late AddressDataModel addressDataModel;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? name;
  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  late String? userid;
  intialData() {
    city = TextEditingController();
    street = TextEditingController();
    name = TextEditingController();
    addressDataModel = Get.arguments['addressDataModel'];
    city!.text = addressDataModel.addressCity!;
    street!.text = addressDataModel.addressStreet!;
    name!.text = addressDataModel.addressName!;
    update();
  }

  clearData() {
    city!.text = "";
    street!.text = "";
    name!.text = "";
    update();
  }

  editAdress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.editAddress(
      addressDataModel.addressId!,
      name!.text,
      city!.text,
      street!.text,
      addressDataModel.addressLat!,
      addressDataModel.addressLat!,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.toNamed(AppRoute.addressview);
      } else {
        Get.defaultDialog(middleText: "please, try again");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() async {
    intialData();
    super.onInit();
  }
}
