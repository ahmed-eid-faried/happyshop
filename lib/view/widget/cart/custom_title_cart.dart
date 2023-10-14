import 'package:happyshop/controller/cart/cart_controller_imp.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitleCart extends StatelessWidget {
  const CustomTitleCart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());

    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(
          color: AppColor.thirdColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.all(4.0),
        child: Center(
            child: GetBuilder<CartControllerImp>(
          builder: (controller) => Text(
            "YOU HAVE ${controller.count} ITEMS IN YOUR LIST",
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )),
      ),
    );
  }
}
