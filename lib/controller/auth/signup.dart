import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/data/datasource/remote/auth/signupdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignin();
  goToverfiyCodeSignUp();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController username;
  SignupData signupData = SignupData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
        username.text,
        password.text,
        email.text,
        phone.text,
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.verfiyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Warning",
              backgroundColor: AppColor.primaryColor.withOpacity(0.6),
              middleTextStyle: const TextStyle(color: Colors.white),
              middleText: "your phone or email already exists");
          // statusRequest = StatusRequest.noAction;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  goToSignin() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    username.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToverfiyCodeSignUp() {
    Get.offAllNamed(AppRoute.verfiyCodeSignUp);
  }
}
