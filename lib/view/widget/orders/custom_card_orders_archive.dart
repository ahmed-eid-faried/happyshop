import 'package:happyshop/controller/orders/archive_orders_controller.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/constant/fonts.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/data/model/orders.dart';
import 'package:happyshop/view/widget/orders/rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CustomCardOrdersArchive extends StatelessWidget {
  const CustomCardOrdersArchive({super.key, required this.ordersModel});
  final OrdersModel ordersModel;
  @override
  Widget build(BuildContext context) {
    ArchiveOrdersViewController controller =
        Get.put(ArchiveOrdersViewController());

    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListTile(
            title: Text("Number Of Order:  ${ordersModel.ordersId!}",
                style: AppFonts.textStyle7),
            trailing: Text(
              Jiffy.parse(ordersModel.ordersDatetime!, pattern: "yyyy-MM-dd")
                  .fromNow()
                  .toString(),
              style: AppFonts.textStyle6,
            ),
          ),
          Text(
              "Recive Type:  ${controller.getValOfReciveType(ordersModel.ordersRecivetype!)}",
              style: AppFonts.textStyle4),
          Text("Orders Price:  ${ordersModel.ordersPrice!} \$",
              style: AppFonts.textStyle4),
          ordersModel.ordersPricedelivery != "0"
              ? Text("Delivery Price:  ${ordersModel.ordersPricedelivery!} \$",
                  style: AppFonts.textStyle4)
              : const Text("Delivery Price:  Free", style: AppFonts.textStyle4),
          Text(
              "Payment Method:  ${controller.getValOfPaymentMethod(ordersModel.ordersPaymentmethod!)}",
              style: AppFonts.textStyle4),
          const Divider(color: AppColor.primaryColor),
          Text(
              "Order Status:  ${controller.getValOfOrderStatus(ordersModel.ordersStatus!)}",
              style: AppFonts.textStyle4),
          const Divider(color: AppColor.primaryColor),
          Row(
            children: [
              Text("Total Price:  ${ordersModel.ordersTotalprice!} \$",
                  textAlign: TextAlign.start, style: AppFonts.textStyle),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.orderdetails,
                        arguments: {"ordersModel": ordersModel});
                  },
                  child: const Text("Details")),
              if (ordersModel.ordersRating == "0")
                TextButton(
                    onPressed: () {
                      showRatingDialog(ordersModel.ordersId!);
                    },
                    child: const Text("Rating")),
            ],
          ),
        ]),
      ),
    );
  }
}
