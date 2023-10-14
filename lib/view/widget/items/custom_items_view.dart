import 'package:happyshop/controller/favorite/favorite_controller.dart';
import 'package:happyshop/controller/items/items_controller.dart';
import 'package:happyshop/core/class/discount.dart';
import 'package:happyshop/core/constant/applink.dart';
import 'package:happyshop/core/function/translatelang.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:happyshop/core/class/heros_types.dart';
import 'package:happyshop/view/widget/items/custom_price_and_fav_widget.dart';
import 'package:happyshop/view/widget/items/custom_rating_and_delivery_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomItemsView extends StatelessWidget {
  const CustomItemsView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());

    return GetBuilder<ItemsControllerImp>(
        builder: (controller) => Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ...List.generate(controller.items.length, (index) {
                    var itemsModel =
                        ItemsModel.fromJson(controller.items[index]);
                    controller.itemsModelList.add(itemsModel);
                    controllerFav.setFavorite(
                        itemsModel.itemsId, itemsModel.favorite);
                    return SizedBox(
                      width: getValueForScreenType<double>(
                        context: context,
                        mobile: double.infinity,
                        tablet: Get.width < 1000 ? (Get.width - 30) / 2 : 300,
                        desktop: Get.width < 3000 ? (Get.width - 45) / 3 : 300,
                      ),
                      child: Discount(
                          discount: double.parse(itemsModel.itemsDiscount!),
                          text: "Discount ${itemsModel.itemsDiscount!}%",
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: InkWell(
                              onTap: () {
                                   String herotag = '${HerosTypes.item}_${itemsModel.itemsId}';
              controller.goToItemsDetails(itemsModel, herotag);
                               },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Hero(
                                        tag: '${HerosTypes.item}_${itemsModel.itemsId}',
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
                                              langCode: "en",
                                              text: itemsModel.itemsName!),
                                        ]),
                                        style: const TextStyle(fontSize: 16),
                                        maxLines: 1,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                          translateMultiLang([
                                            TranslateMultiLangModel(
                                                langCode: "ar",
                                                text: itemsModel.itemsDesAr!),
                                            TranslateMultiLangModel(
                                                langCode: "en",
                                                text: itemsModel.itemsDes!),
                                          ]),
                                          maxLines: 2,
                                          textAlign: TextAlign.center),
                                      const SizedBox(height: 5),
                                      CustomRatingAndDeliveryTimeWidget(
                                          itemsModel, index),
                                      const SizedBox(height: 5),
                                      CustomPriceAndFavWidget(
                                          itemsModel: itemsModel),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                    );
                  })
                ]));
  }
}
