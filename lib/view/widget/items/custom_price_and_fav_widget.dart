import 'package:happyshop/controller/favorite/favorite_controller.dart';
import 'package:happyshop/controller/items/items_controller.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPriceAndFavWidget extends GetView<ItemsControllerImp> {
  const CustomPriceAndFavWidget({
    super.key,
    required this.itemsModel,
  });

  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    Get.put(FavoriteControllerImp());
    return Row(
      children: [
        double.parse(itemsModel.itemsDiscount!) != 0.0
            ? Text(
                // controller.totalrating,
                "${itemsModel.itemsPrice!} ",
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
        GetBuilder<FavoriteControllerImp>(
          builder: (controller) {
            return IconButton(
              onPressed: () {
                if (controller.isFavorite[itemsModel.itemsId] == "0") {
                  controller.setFavorite(itemsModel.itemsId, "1");
                  controller.addFavorite(itemsModel.itemsId);
                } else if (controller.isFavorite[itemsModel.itemsId] == "1") {
                  controller.setFavorite(itemsModel.itemsId, "0");
                  controller.removeFavorite(itemsModel.itemsId);
                }
              },
              icon: Icon(
                controller.isFavorite[itemsModel.itemsId] == "1"
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: AppColor.primaryColor,
                size: 25,
              ),
            );
          },
        )
      ],
    );
  }
}
