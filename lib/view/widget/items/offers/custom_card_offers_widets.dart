import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:happyshop/controller/offers_controller_imp.dart';
import 'package:happyshop/core/class/discount.dart';
import 'package:happyshop/core/constant/applink.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/function/translatelang.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:happyshop/core/class/heros_types.dart';
import 'package:happyshop/view/widget/items/offers/custom_discount_and_fav_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardOffersWidets extends StatelessWidget {
  const CustomCardOffersWidets({
    super.key,
    required this.itemsModel,
  });
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
     Get.put(OffersControllerImp());
    return GetBuilder<OffersControllerImp>(
      builder: (controller) => Discount(
        discount: double.parse(itemsModel.itemsDiscount!),
        text: "Discount ${itemsModel.itemsDiscount!}%",
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () {
              String herotag = '${HerosTypes.discount}_${itemsModel.itemsId}';
              controller.goToItemsDetails(itemsModel, herotag);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
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
                              langCode: "ar", text: itemsModel.itemsNameAr!),
                          TranslateMultiLangModel(
                              langCode: "en", text: itemsModel.itemsName!),
                        ]),
                        style: const TextStyle(fontSize: 16),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                          translateMultiLang([
                            TranslateMultiLangModel(
                                langCode: "ar", text: itemsModel.itemsDesAr!),
                            TranslateMultiLangModel(
                                langCode: "en", text: itemsModel.itemsDes!),
                          ]),
                          maxLines: 2,
                          textAlign: TextAlign.center),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "Rating",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          const Spacer(),
                          Text(
                            itemsModel.totalrating.toString(),
                            style: const TextStyle(fontFamily: "ddd"),
                          ),
                          const Icon(
                            Icons.star,
                            color: AppColor.gold,
                            size: 25,
                          ),
                          const SizedBox(width: 7)
                        ],
                      ),
                      const SizedBox(height: 5),
                      CustomDiscountAndFavWidget(itemsModel: itemsModel),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
