import 'package:happyshop/controller/items/items_details_controller.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSubItemsDetails extends GetView<ItemsDetailsControllerImp> {
  const CustomSubItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetailsControllerImp());

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Wrap(
        children: [
          ...List.generate(
              controller.subPropt.length,
              (index) => Container(
                    margin: const EdgeInsets.all(5.0),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: controller.subPropt[index]['active'] == "1"
                            ? AppColor.fourthColor
                            : null,
                        border: Border.all(color: AppColor.fourthColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(controller.subPropt[index]['name'],
                            style: TextStyle(
                              color: controller.subPropt[index]['active'] == "1"
                                  ? Colors.white
                                  : null,
                            ))),
                  ))
        ],
      ),
    );
  }
}
