import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/datasource/remote/customersservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCustomersServiceController extends GetxController {
  CustomersServiceData customersServiceData = CustomersServiceData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController? controllerMessage;
  MyService myServices = Get.find();
  late String? message;
  late String? userid;

  addMessage() async {
    if (formState.currentState!.validate()) {
      userid = myServices.pref.getString("id");
      message = controllerMessage!.text;
      statusRequest = StatusRequest.loading;
      update();
      var response = await customersServiceData.addMessage(userid!, message!);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.back();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    controllerMessage = TextEditingController();
    super.onInit();
  }
}
