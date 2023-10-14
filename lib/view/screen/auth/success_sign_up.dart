import 'package:happyshop/controller/auth/success_signup.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/view/widget/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          '32'.tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            Text("37".tr,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 30)),
            Text("38".tr),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                  text: "31".tr,
                  onPressed: () {
                    controller.goToLogin();
                  }),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
