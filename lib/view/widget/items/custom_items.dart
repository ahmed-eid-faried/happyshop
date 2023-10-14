import 'package:happyshop/controller/items/items_controller.dart';
import 'package:happyshop/data/model/categories_model.dart';
import 'package:happyshop/view/widget/items/categories_items_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItems extends GetView<ItemsControllerImp> {
  const CustomItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());

    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoriesItemsColumn(
            index: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}
