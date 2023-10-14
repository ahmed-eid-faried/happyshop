import 'package:happyshop/controller/home/home_screen_controller.dart';
import 'package:happyshop/data/model/categories_model.dart';
import 'package:happyshop/view/widget/home_screen/custom_catogeries/categories_home_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCatogeries extends GetView<HomeScreenControllerImp> {
  const CustomCatogeries({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 125,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoriesHomeColumn(
            index: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}
