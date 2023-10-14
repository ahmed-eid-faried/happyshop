import 'package:happyshop/controller/home/home_screen_controller.dart';
import 'package:happyshop/core/constant/applink.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/translatelang.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happyshop/core/class/heros_types.dart';

class CustomItemsHomeView extends StatelessWidget {
  const CustomItemsHomeView({super.key, required this.itemsModel});
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());

    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () {
              String herotag = '${HerosTypes.item}_${itemsModel.itemsId}';
              Get.toNamed(AppRoute.itemsdetails,
                  arguments: {"itemsModel": itemsModel,"herotag":herotag});
            },
            child: Container(
              margin: const EdgeInsets.only(top: 5.0),
              width: double.infinity,
              height: Get.height / 5,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Hero(
                          tag: '${HerosTypes.item}_${itemsModel.itemsId}',
                          child: CachedNetworkImage(
                              imageUrl:
                                  "${AppLink.imageitems}/${itemsModel.itemsImage}",
                              height: 90,
                              fit: BoxFit.contain),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Text(
                                  translateMultiLang(
                                    [
                                      TranslateMultiLangModel(
                                          langCode: "ar",
                                          text: itemsModel.itemsNameAr!),
                                      TranslateMultiLangModel(
                                          langCode: "en",
                                          text: itemsModel.itemsName!),
                                    ],
                                  ),
                                  maxLines: 1,
                                  textAlign: TextAlign.center),
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
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
