import 'package:happyshop/controller/orders/order_details_controller.dart';
import 'package:happyshop/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happyshop/view/widget/auth/custom_button_auth.dart';
import 'package:happyshop/view/widget/orders/custom_orders_details_map.dart';
import 'package:happyshop/view/widget/orders/custom_orders_details_price.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/constant/fonts.dart';
import 'package:happyshop/core/constant/routes.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        title: const Text("Orders Details"),
        leading: IconButton(
          onPressed: () {
            Get.offNamed(AppRoute.home);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: GetBuilder<OrderDetailsController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  const CustomOrdersDetailsPrice(),
                  const SizedBox(height: 20),
                  if (controller.ordersRecivetype == "0")
                    Card(
                      child: ListTile(
                        title: Text(
                          controller.addressCity != ''
                              ? controller.addressCity
                              : controller.addressStreet,
                          textAlign: TextAlign.start,
                          style: AppFonts.textStyle3,
                          maxLines: 1,
                        ),
                        leading: const Icon(
                          Icons.location_on,
                          color: AppColor.primaryColor,
                          size: 30,
                        ),
                        subtitle: Text(
                          "${controller.addressCity} ${controller.addressStreet}",
                          textAlign: TextAlign.start,
                          maxLines: 3,
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  if (controller.ordersRecivetype == "0")
                    const SizedBox(
                      height: 250,
                      width: 250,
                      child: CustomOrdersDetailsMap(),
                    ),
                  const SizedBox(height: 20),
                  if (controller.ordersRecivetype == "0" &&
                      controller.ordersModel.ordersStatus == "3")
                    CustomButtonAuth(
                      text: "Tracking",
                      onPressed: () {
                        Get.toNamed(
                          AppRoute.trackingorderdetails,
                          arguments: {"ordersModel": controller.ordersModel},
                        );
                      },
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
