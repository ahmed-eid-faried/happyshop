import 'package:cached_network_image/cached_network_image.dart';
import 'package:happyshop/controller/home/home_screen_controller.dart';
import 'package:happyshop/controller/home/search.dart';
import 'package:happyshop/core/class/handling_data_view.dart';
import 'package:happyshop/core/class/heros_types.dart';
import 'package:happyshop/core/class/lottile_background.dart';
import 'package:happyshop/core/constant/applink.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/translatelang.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SearchControllerImp searchController = Get.put(SearchControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => SizedBox(
              height: 0.8 * Get.height,
              child: LottileBackground(
                beforeChild: HandlingDataView(
                    statusRequest: controller.statusRequest,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: searchController.searchitems.length,
                      itemBuilder: (BuildContext context, int index) {
                        ItemsModel itemsModel =
                            searchController.searchitems[index];
                        return InkWell(
                          onTap: () {
                            String herotag = "${HerosTypes.noThing}";
                            Get.toNamed(AppRoute.itemsdetails, arguments: {
                              "itemsModel": itemsModel,
                              "herotag": herotag
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            width: double.infinity,
                            height: Get.height / 5,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "${AppLink.imageitems}/${itemsModel.itemsImage}",
                                          height: 90,
                                          fit: BoxFit.contain),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListView(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: [
                                            Text(
                                                translateMultiLang(
                                                  [
                                                    TranslateMultiLangModel(
                                                        langCode: "ar",
                                                        text: itemsModel
                                                            .itemsNameAr!),
                                                    TranslateMultiLangModel(
                                                        langCode: "en",
                                                        text: itemsModel
                                                            .itemsName!),
                                                  ],
                                                ),
                                                maxLines: 1,
                                                textAlign: TextAlign.center),
                                            const SizedBox(height: 5),
                                            Text(
                                                translateMultiLang([
                                                  TranslateMultiLangModel(
                                                      langCode: "ar",
                                                      text: itemsModel
                                                          .itemsDesAr!),
                                                  TranslateMultiLangModel(
                                                      langCode: "en",
                                                      text:
                                                          itemsModel.itemsDes!),
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
                        );
                      },
                    )),
              ),
            ));
  }
}
