import 'package:cached_network_image/cached_network_image.dart';
import 'package:happyshop/controller/items/items_details_controller.dart';
import 'package:happyshop/core/constant/applink.dart';
import 'package:happyshop/core/constant/color.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
class CustomImageItemsDetails extends GetView<ItemsDetailsControllerImp> {
  const CustomImageItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetailsControllerImp());
     return SizedBox(
      height:  Get.height*0.30,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            color: AppColor.primaryColor,
            height: Get.height*0.20,
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height*0.10,),
            child: Center(
              child: Hero(
                tag: controller.heroTag,
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLink.imageitems}/${controller.itemsModel.itemsImage}",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// firebase crashlytics:symbols:upload --app=FIREBASE_APP_ID 1:102571397024:android:c5864052dc804ee7561ec5/symbols
// firebase crashlytics:symbols:upload --app=FIREBASE_APP_ID 1:102571397024:android:5bdb9fa1061ebb77561ec5
