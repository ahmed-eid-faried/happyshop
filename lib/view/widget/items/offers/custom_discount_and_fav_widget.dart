 import 'package:happyshop/controller/offers_controller_imp.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDiscountAndFavWidget extends StatelessWidget {
  const CustomDiscountAndFavWidget({
    super.key,
    required this.itemsModel,
  });
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    OffersControllerImp controller = Get.put(OffersControllerImp());
    return Row(
      children: [
        double.parse(itemsModel.itemsDiscount!) != 0.0
            ? Text(
                itemsModel.itemsPrice!,
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontFamily: "ddd",
                    fontSize: 14,
                    color: AppColor.black),
              )
            : const Text(""),
        Text(
          "  ${itemsModel.itemspricediscount!} \$",
          textDirection: TextDirection.ltr,
          style: const TextStyle(
              fontFamily: "ddd", fontSize: 18, color: AppColor.primaryColor),
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              controller.averageTime,
              style:
                  const TextStyle(color: AppColor.primaryColor, fontSize: 18),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.timer_outlined,
              color: AppColor.primaryColor,
              size: 25,
            ),
          ],
        )
      ],
    );
  }
}
