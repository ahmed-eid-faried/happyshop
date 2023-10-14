import 'package:happyshop/controller/home/home_screen_controller.dart';
import 'package:happyshop/core/constant/applink.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/function/translatelang.dart';
import 'package:happyshop/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_svg_image/cached_network_svg_image.dart';

class CategoriesHomeColumn extends GetView<HomeScreenControllerImp> {
  final CategoriesModel categoriesModel;
  final int index;
  const CategoriesHomeColumn(
      {super.key, required this.index, required this.categoriesModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, index, categoriesModel.categoriesId!);
      },
      child: SizedBox(
        height: 125,
        child: Column(
          children: [
            Container(
                width: 65,
                height: 65,
                decoration: const BoxDecoration(
                    color: AppColor.thirdColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CachedNetworkSVGImage(
                    "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
                    placeholder: const CircularProgressIndicator(
                        color: AppColor.primaryColor),
                    errorWidget: const Icon(Icons.error),
                    height: 20.0,
                    // color: AppColor.secondColor,
                    fit: BoxFit.contain,
                    fadeDuration: const Duration(milliseconds: 500),
                  ),
                )),
            Text(translateMultiLang([
              TranslateMultiLangModel(
                  langCode: "ar", text: categoriesModel.categoriesNameAr!),
              TranslateMultiLangModel(
                  langCode: "en", text: categoriesModel.categoriesName!),
            ])),
          ],
        ),
      ),
    );
  }
}
