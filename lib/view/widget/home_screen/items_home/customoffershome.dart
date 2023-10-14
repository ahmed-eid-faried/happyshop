import 'package:happyshop/controller/home/home_screen_controller.dart';
import 'package:happyshop/core/class/discount.dart';
import 'package:happyshop/core/constant/applink.dart';
import 'package:happyshop/core/function/translatelang.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happyshop/core/class/heros_types.dart';

class CustomOffersHomeView extends StatelessWidget {
  const CustomOffersHomeView({super.key, required this.itemsModel});
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Discount(
              discount: double.parse(itemsModel.itemsDiscount!),
              text: "Discount ${itemsModel.itemsDiscount!}%",
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    String herotag =
                        '${HerosTypes.discount}_${itemsModel.itemsId}';
                    controller.goToItemsDetails(itemsModel, herotag);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Hero(
                            tag: '${HerosTypes.discount}_${itemsModel.itemsId}',
                            child: CachedNetworkImage(
                                imageUrl:
                                    "${AppLink.imageitems}/${itemsModel.itemsImage}",
                                height: 90,
                                fit: BoxFit.contain),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            translateMultiLang([
                              TranslateMultiLangModel(
                                  langCode: "ar",
                                  text: itemsModel.itemsNameAr!),
                              TranslateMultiLangModel(
                                  langCode: "en", text: itemsModel.itemsName!),
                            ]),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
