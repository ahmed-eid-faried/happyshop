import 'package:happyshop/controller/items/items_details_controller.dart';
import 'package:happyshop/core/constant/color.dart';
 import 'package:happyshop/core/function/alertexitapp.dart';
import 'package:happyshop/core/function/translatelang.dart';
import 'package:happyshop/view/widget/items_details/custom_button_addto_cart.dart';
import 'package:happyshop/view/widget/items_details/custom_descripstion_items_details.dart';
import 'package:happyshop/view/widget/items_details/custom_image_items_details.dart';
import 'package:happyshop/view/widget/items_details/custom_label_items_details.dart';
import 'package:happyshop/view/widget/items_details/custom_price_items_details.dart';
import 'package:happyshop/view/widget/items_details/ratingdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetailsControllerImp());
    return WillPopScope(
      onWillPop: backAppHome,
      child: Scaffold(
        bottomNavigationBar: const CustomButtonAddtoCart(),
        body: GetBuilder<ItemsDetailsControllerImp>(
          builder: (controller) => SizedBox(
            width: double.infinity,
            child: ListView(
              children: [
                const CustomImageItemsDetails(),
                const SizedBox(height: 60),
                CustomLabelItemsDetails(translateMultiLang([
                  TranslateMultiLangModel(
                      langCode: "ar", text: controller.itemsModel.itemsNameAr!),
                  TranslateMultiLangModel(
                      langCode: "en", text: controller.itemsModel.itemsName!),
                ])),
                CustomPriceItemsDetails(controller.itemspricediscount),
                CustomDescripstionItemsDetails(translateMultiLang([
                  TranslateMultiLangModel(
                      langCode: "ar", text: controller.itemsModel.itemsDesAr!),
                  TranslateMultiLangModel(
                      langCode: "en", text: controller.itemsModel.itemsDes!)
                ])),
                if (controller.totalrating == "0")
                  TextButton(
                      onPressed: () {
                        showRatingDialogItems(controller.itemsModel.itemsId!);
                      },
                      child: const Text("Rating")),
                if (controller.totalrating != "0")
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Rating",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: AppColor.fourthColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "${controller.totalrating} ",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: AppColor.fourthColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        ...List.generate(
                            int.parse(controller.totalrating),
                            (index) => const Icon(
                                  Icons.star,
                                  size: 25,
                                  color: AppColor.gold,
                                ))
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
