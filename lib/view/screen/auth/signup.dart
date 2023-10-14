import 'package:happyshop/controller/auth/signup.dart';
import 'package:happyshop/core/class/handling_data_view.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/function/alertexitapp.dart';
import 'package:happyshop/core/function/validinput.dart';
import 'package:happyshop/view/widget/auth/custom_body_auth.dart';
import 'package:happyshop/view/widget/auth/custom_button_auth.dart';
import 'package:happyshop/view/widget/auth/custom_text_field_auth.dart';
import 'package:happyshop/view/widget/auth/custom_text_nivagtor_auth.dart';
import 'package:happyshop/view/widget/auth/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    // SignUpControllerImp controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          '17'.tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            CustomTitleAuth(title: '10'.tr),
                            CustomBodyAuth(body: "24".tr),
                            CustomTextFieldAuth(
                                validator: (val) => validator(val, "username"),
                                controller: controller.username,
                                label: "20".tr,
                                hintText: "23".tr,
                                icon: Icons.person_2_outlined),
                            CustomTextFieldAuth(
                                validator: (val) => validator(val, "email"),
                                controller: controller.email,
                                label: "18".tr,
                                hintText: "12".tr,
                                icon: Icons.email_outlined),
                            CustomTextFieldAuth(
                                validator: (val) => validator(val, "phone"),
                                controller: controller.phone,
                                label: "21".tr,
                                hintText: "22".tr,
                                keyboardType: TextInputType.phone,
                                icon: Icons.phone_android_outlined),
                            CustomTextFieldAuth(
                                validator: (val) => validator(val, "password"),
                                controller: controller.password,
                                label: "19".tr,
                                hintText: "13".tr,
                                icon: Icons.lock_outlined),
                            const SizedBox(height: 20),
                            CustomButtonAuth(
                                text: "17".tr,
                                onPressed: () {
                                  // controller.goToverfiyCodeSignUp();
                                  controller.signUp();
                                }),
                            const SizedBox(height: 20),
                            CustomTextNivagtorAuth(
                              text1: "15".tr,
                              text2: "25".tr,
                              ontap: () {
                                controller.goToSignin();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))

              //  controller.statusRequest ==
              //         StatusRequest.loading
              //     ? Lottie.asset(AppImageAsset.loading)
              //     :

              )),
    );
  }
}
