import 'package:happyshop/controller/items/items_details_controller.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPriceItemsDetails extends GetView<ItemsDetailsControllerImp> {
  const CustomPriceItemsDetails(this.itemspricediscount, {super.key});
  final String itemspricediscount;
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetailsControllerImp());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                controller.additem();
              },
              icon: const Icon(Icons.add)),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Center(
                      child: GetBuilder<ItemsDetailsControllerImp>(
                          builder: (controller) => Text(
                                "${controller.value}",
                                style: const TextStyle(fontSize: 20),
                              ))),
                )),
          ),
          IconButton(
              onPressed: () {
                controller.deleteitem();
              },
              icon: const Icon(Icons.remove)),
          const Spacer(),
          SizedBox(
              child: Text(
            "$itemspricediscount \$",
            style: const TextStyle(
                color: AppColor.fourthColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}
