import 'package:happyshop/controller/items/items_details_controller.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLabelItemsDetails extends GetView<ItemsDetailsControllerImp> {
  const CustomLabelItemsDetails(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetailsControllerImp());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: const TextStyle(
            color: AppColor.fourthColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
