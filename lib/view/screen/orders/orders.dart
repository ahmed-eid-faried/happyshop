import 'package:happyshop/controller/orders/orders_view_controller.dart';
import 'package:happyshop/core/class/handling_data_view.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/data/model/orders.dart';
import 'package:happyshop/view/widget/orders/custom_card_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersViewController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.backgroundcolor,
          title: const Text("View Orders"),
          leading: IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.home);
              },
              icon: const Icon(Icons.arrow_back))),
      body: GetBuilder<OrdersViewController>(
        builder: (controller) {
          return HandlingDataView(
              paddingOfflineViewDataWidget: false,
              view: true,
              statusRequest: controller.statusRequest,
              child: Container(
                margin: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    OrdersModel ordersModel = controller.data[index];

                    return CustomCardOrders(ordersModel: ordersModel);
                  },
                ),
              ));
        },
      ),
    );
  }
}
