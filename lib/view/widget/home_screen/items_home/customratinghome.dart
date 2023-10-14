import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happyshop/controller/home/home_screen_controller.dart';
import 'package:happyshop/core/constant/applink.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/function/translatelang.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:happyshop/core/class/heros_types.dart';

class CustomRatingHomeView extends StatelessWidget {
  const CustomRatingHomeView({super.key, required this.itemsModel});
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Padding(
        padding: EdgeInsets.all(4.0.w),
        child: InkWell(
          onTap: () {
            String herotag = '${HerosTypes.rating}_${itemsModel.itemsId}';
            controller.goToItemsDetails(itemsModel, herotag);
          },
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: '${HerosTypes.rating}_${itemsModel.itemsId}',
                    child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageitems}/${itemsModel.itemsImage}",
                        height: 90.h,
                        fit: BoxFit.contain),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    translateMultiLang([
                      TranslateMultiLangModel(
                          langCode: "ar", text: itemsModel.itemsNameAr!),
                      TranslateMultiLangModel(
                          langCode: "en", text: itemsModel.itemsName!),
                    ]),
                    maxLines: 1,
                  ),
                  if (itemsModel.totalrating != "0")
                    Padding(
                      padding: EdgeInsets.all(3.0.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                              double.parse(itemsModel.totalrating!).ceil(),
                              (index) => Icon(
                                    Icons.star,
                                    size: 18.h,
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
      ),
    );
  }
}
