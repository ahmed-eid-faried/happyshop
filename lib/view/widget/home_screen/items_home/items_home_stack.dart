import 'package:happyshop/controller/home/home_screen_controller.dart';
import 'package:happyshop/core/constant/applink.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/function/translatelang.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:happyshop/core/class/heros_types.dart';

class ItemsHomeStack extends GetView<HomeScreenControllerImp> {
  final ItemsModel itemsModel;

  const ItemsHomeStack({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        String herotag = '${HerosTypes.selling}_${itemsModel.itemsId}';

        controller.goToItemsDetails(itemsModel, herotag);
      },
      child: Stack(
        children: [
          Hero(
            tag: '${HerosTypes.selling}_${itemsModel.itemsId}',
            child: SizedBox(
              width: 180,
              height: 140,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageitems}/${itemsModel.itemsImage}",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            width: 180,
            height: 140,
            decoration: BoxDecoration(
                color: AppColor.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 160,
              child: Text(
                translateMultiLang([
                  TranslateMultiLangModel(
                    langCode: "ar",
                    text: itemsModel.itemsNameAr!,
                  ),
                  TranslateMultiLangModel(
                    langCode: "en",
                    text: itemsModel.itemsName!,
                  ),
                ]),
                maxLines: 3,
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ),
          )
        ],
      ),
    );
  }
}
