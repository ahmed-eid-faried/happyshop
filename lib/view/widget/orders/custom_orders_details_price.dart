import 'package:happyshop/controller/orders/order_details_controller.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/constant/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happyshop/core/constant/imgaeasset.dart';
import 'package:lottie/lottie.dart';

class CustomOrdersDetailsPrice extends StatelessWidget {
  const CustomOrdersDetailsPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return GetBuilder<OrderDetailsController>(builder: (controller) {
      return Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const SizedBox(height: 20),
                controller.loading == true
                    ? SizedBox(
                        width: 150,
                        height: 150,
                        child: Lottie.asset(
                          AppImageAsset.ecommerce,
                        ))
                    : Table(
                        children: [
                          const TableRow(children: [
                            Text("Item",
                                textAlign: TextAlign.center,
                                style: AppFonts.textStyle),
                            Text("QTY",
                                textAlign: TextAlign.center,
                                style: AppFonts.textStyle),
                            Text("Price",
                                textAlign: TextAlign.center,
                                style: AppFonts.textStyle),
                          ]),
                          ...List.generate(controller.itemsData.length,
                              (index) {
                            return TableRow(children: [
                              Text(
                                controller.itemsData[index].itemsName!,
                                style: AppFonts.textStyle2,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                controller.itemsData[index].countitems!,
                                style: AppFonts.textStyle2,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                // ((double.parse(controller
                                //             .itemsData[index].itemsprice!)) /
                                //         (double.parse(
                                //             controller.itemsData[index].countitems!)))
                                //     .toString(),
                                controller.itemsData[index].itemsprice!,
                                style: AppFonts.textStyle2,
                                textAlign: TextAlign.center,
                              ),
                            ]);
                          })
                        ],
                      ),
                const Divider(color: AppColor.primaryColor),
                const SizedBox(height: 10),
                Text("Price: ${controller.ordersPrice} \$",
                    style: AppFonts.textStyle4),
                const SizedBox(height: 10),
                Text("Delivery Price: ${controller.ordersPricedelivery} \$",
                    style: AppFonts.textStyle4),
                const SizedBox(height: 10),
                Text("Coupon: ${controller.coupon} \$",
                    style: AppFonts.textStyle4),
                const SizedBox(height: 10),
                Center(
                    child: Text(
                        "Total Price: ${controller.ordersTotalprice} \$",
                        style: AppFonts.textStyle)),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    });
  }
}
