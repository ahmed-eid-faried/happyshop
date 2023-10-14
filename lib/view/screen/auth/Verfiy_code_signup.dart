import 'package:happyshop/controller/auth/verfiy_code_signup.dart';
import 'package:happyshop/core/class/handling_data_view.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/view/widget/auth/custom_body_auth.dart';
import 'package:happyshop/view/widget/auth/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerfiyCodeSignUpControllerImp());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundcolor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "39".tr,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<VerfiyCodeSignUpControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: ListView(
                      children: [
                        CustomTitleAuth(title: "40".tr),
                        CustomBodyAuth(body: "41".tr),
                        CustomBodyAuth(body: controller.email),
                        const SizedBox(height: 15),
                        OtpTextField(
                          fieldWidth: 45.0,
                          borderRadius: BorderRadius.circular(18),
                          numberOfFields: 5,
                          borderColor: const Color(0xFF512DA8),
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            controller.goToSuccessSignUp(verificationCode);
                          }, // end onSubmit
                        ),
                        const SizedBox(height: 40),
                        Center(
                          child: InkWell(
                              onTap: () {
                                controller.resend();
                              },
                              child: const Text(
                                "Resend",
                                style: TextStyle(
                                    color: AppColor.primaryColor, fontSize: 20),
                              )),
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
