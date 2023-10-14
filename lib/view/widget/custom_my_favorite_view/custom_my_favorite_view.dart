import 'package:happyshop/controller/favorite/my_favorite_view_controller.dart';
import 'package:happyshop/core/constant/applink.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/function/translatelang.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:happyshop/data/model/my_favorite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happyshop/core/class/heros_types.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomMyFavoriteView extends StatelessWidget {
  const CustomMyFavoriteView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteViewControllerImp());
    return GetBuilder<MyFavoriteViewControllerImp>(
        builder: (controller) => Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ...List.generate(controller.myFavoriteViewList.length, (index) {
                  MyFavoriteViewModel favoritemodel =
                      controller.myFavoriteViewList[index];
                  print(Get.width);
                  return SizedBox(
                    width: getValueForScreenType<double>(
                      context: context,
                      mobile: double.infinity,
                      tablet: Get.width < 1000 ? (Get.width - 30) / 2 : 300,
                      desktop: Get.width < 3000 ? (Get.width - 45) / 3 : 300,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: () {
                          ItemsModel favoritemodel =
                              controller.itemsViewList[index];
                        String herotag=  '${HerosTypes.fav}_${favoritemodel.itemsId}';
                          controller.goToItemsDetails(favoritemodel, herotag);
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Hero(
                                  tag:
                                      '${HerosTypes.fav}_${favoritemodel.itemsId}',
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          "${AppLink.imageitems}/${favoritemodel.itemsImage}",
                                      height: 90,
                                      fit: BoxFit.contain),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  translateMultiLang([
                                    TranslateMultiLangModel(
                                        langCode: "ar",
                                        text: favoritemodel.itemsNameAr!),
                                    TranslateMultiLangModel(
                                        langCode: "en",
                                        text: favoritemodel.itemsName!),
                                  ]),
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                    translateMultiLang([
                                      TranslateMultiLangModel(
                                          langCode: "ar",
                                          text: favoritemodel.itemsDesAr!),
                                      TranslateMultiLangModel(
                                          langCode: "en",
                                          text: favoritemodel.itemsDes!),
                                    ]),
                                    maxLines: 2,
                                    textAlign: TextAlign.center),
                                const SizedBox(height: 5),
                                (favoritemodel.totalrating == null)
                                    ? const Text("")
                                    : Row(
                                        children: [
                                          const SizedBox(width: 12),
                                          const Text(
                                            "Rating",
                                            style: TextStyle(
                                              fontFamily: "ddd",
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            favoritemodel.totalrating!,
                                            style: const TextStyle(
                                                fontFamily: "ddd"),
                                          ),
                                          const Icon(
                                            Icons.star,
                                            color: AppColor.gold,
                                            size: 15,
                                          ),
                                          const SizedBox(width: 12)
                                        ],
                                      ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    double.parse(
                                                favoritemodel.itemsDiscount!) !=
                                            0.0
                                        ? Text(
                                            favoritemodel.itemsPrice!,
                                            textDirection: TextDirection.ltr,
                                            style: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontFamily: "ddd",
                                                fontSize: 14,
                                                color: AppColor.black),
                                          )
                                        : const Text(""),
                                    Text(
                                      "  ${favoritemodel.itemspricediscount!} \$",
                                      textDirection: TextDirection.ltr,
                                      style: const TextStyle(
                                          fontFamily: "ddd",
                                          fontSize: 18,
                                          color: AppColor.primaryColor),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        controller.deletedata(
                                            favoritemodel.favoriteId);
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: AppColor.primaryColor,
                                        size: 15,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })
              ],
            ));
  }
}
