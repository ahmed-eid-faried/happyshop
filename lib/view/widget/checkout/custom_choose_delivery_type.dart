import 'package:happyshop/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happyshop/controller/cart/checkout_controller.dart';

class CustomChooseDeliveryType extends StatelessWidget {
  const CustomChooseDeliveryType({
    super.key,
    required this.title,
    required this.image,
    required this.val,
  });
  final String title;
  final String image;
  final String val;

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());

    return GetBuilder<CheckoutController>(
      builder: (controller) => InkWell(
        onTap: () {
          controller.deliverySelector = val;
          controller.update();
        },
        child: Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: controller.deliverySelector == val
                    ? AppColor.primaryColor
                    : Colors.white,
                border: Border.all(color: AppColor.primaryColor)),
            child: Column(
              children: [
                Image.asset(image,
                    height: 50,
                    width: 50,
                    color: controller.deliverySelector == val
                        ? Colors.white
                        : null),
                Text(
                  title,
                  style: TextStyle(
                      color: controller.deliverySelector == val
                          ? Colors.white
                          : AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
      ),
    );
  }
}
