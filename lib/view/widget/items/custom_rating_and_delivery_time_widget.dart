import 'package:happyshop/controller/items/items_controller.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/constant/fonts.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRatingAndDeliveryTimeWidget extends GetView<ItemsControllerImp> {
  const CustomRatingAndDeliveryTimeWidget(this.itemsModel, this.index,
      {super.key});
  final ItemsModel itemsModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Row(
      children: [
        const Text("Rating", style: AppFonts.textStyle8),
        const SizedBox(width: 10),
        if (itemsModel.totalrating != null && itemsModel.totalrating != "")
          Text(
            // controller.itemsModelList[index].totalrating!,
            itemsModel.totalrating!,
            style: AppFonts.textStyle8,
          ),
        if (itemsModel.totalrating != null && itemsModel.totalrating != "")
          const Icon(
            Icons.star,
            color: AppColor.gold,
            size: 15,
          ),
        if (itemsModel.totalrating != null && itemsModel.totalrating != "")
          const Spacer(),
        const Icon(
          Icons.timer_outlined,
          color: AppColor.grey,
        ),
        const SizedBox(width: 10),
        Text(
          "${controller.deliverytime} Min",
          style: AppFonts.textStyle8,
        ),
      ],
    );
  }
}
