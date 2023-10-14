import 'package:happyshop/controller/cart/cart_controller_imp.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRowTitleCart extends StatelessWidget {
  const CustomRowTitleCart({
    super.key,
    required this.title,
    required this.value,
    this.color = false,
  });
  final String title;
  final String value;
  final bool color;

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return GetBuilder<CartControllerImp>(
      builder: (controller) => Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: color ? AppColor.primaryColor : AppColor.grey,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            "$value ",
            style: TextStyle(
                color: color ? AppColor.primaryColor : AppColor.grey,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
