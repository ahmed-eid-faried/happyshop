import 'package:happyshop/controller/offers_controller_imp.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:happyshop/view/widget/items/offers/custom_card_offers_widets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomOffersView extends StatelessWidget {
  const CustomOffersView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OffersControllerImp());
    return GetBuilder<OffersControllerImp>(
        builder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ...List.generate(controller.items.length, (index) {
                      var itemsModel =
                          ItemsModel.fromJson(controller.items[index]);
                      return SizedBox(
                        width: getValueForScreenType<double>(
                          context: context,
                          mobile: double.infinity,
                          tablet: Get.width < 960 ? (Get.width - 50) / 2 : 300,
                          desktop:
                              Get.width < 3000 ? (Get.width - 75) / 3 : 300,
                        ),
                        child: CustomCardOffersWidets(itemsModel: itemsModel),
                      );
                    })
                  ]),
            ));
  }
}
