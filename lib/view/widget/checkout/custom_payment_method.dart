import 'package:happyshop/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happyshop/controller/cart/checkout_controller.dart';

class CustomPaymentMethod extends StatelessWidget {
  const CustomPaymentMethod(
      {super.key, required this.title, required this.val});
  final String title;
  final String val;

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());

    return GetBuilder<CheckoutController>(
      builder: (controller) => InkWell(
        onTap: () {
          controller.paymentsSelector = val;
          controller.update();
        },
        child: Container(
            width: 0.8 * Get.width,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: controller.paymentsSelector == val
                    ? AppColor.primaryColor
                    : AppColor.thirdColor,
                border: Border.all(color: AppColor.primaryColor)),
            child: Text(
              title,
              style: TextStyle(
                  color: controller.paymentsSelector == val
                      ? Colors.white
                      : AppColor.primaryColor,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
