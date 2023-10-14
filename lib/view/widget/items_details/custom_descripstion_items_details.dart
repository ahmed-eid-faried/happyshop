import 'package:happyshop/controller/items/items_details_controller.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDescripstionItemsDetails
    extends GetView<ItemsDetailsControllerImp> {
  const CustomDescripstionItemsDetails(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetailsControllerImp());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: const TextStyle(
            color: AppColor.grey2, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
