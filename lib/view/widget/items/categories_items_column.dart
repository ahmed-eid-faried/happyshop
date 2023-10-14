import 'package:happyshop/controller/home/home_screen_controller.dart';
import 'package:happyshop/controller/items/items_controller.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/function/translatelang.dart';
import 'package:happyshop/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesItemsColumn extends GetView<HomeScreenControllerImp> {
  final CategoriesModel categoriesModel;
  final int index;
  const CategoriesItemsColumn(
      {super.key, required this.index, required this.categoriesModel});
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return GetBuilder<ItemsControllerImp>(
        builder: (controller) => InkWell(
              onTap: () {
                controller.changeCat(index, categoriesModel.categoriesId!);
              },
              child: Container(
                decoration: controller.index == index
                    ? const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColor.primaryColor, width: 2)))
                    : null,
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: controller.index == index
                      ? const EdgeInsets.symmetric(horizontal: 5)
                      : const EdgeInsets.all(5),
                  child: Text(translateMultiLang([
                    TranslateMultiLangModel(
                        langCode: "ar",
                        text: categoriesModel.categoriesNameAr!),
                    TranslateMultiLangModel(
                        langCode: "en", text: categoriesModel.categoriesName!),
                  ])),
                ),
              ),
            ));
  }
}
