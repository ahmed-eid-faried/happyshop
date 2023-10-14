import 'package:happyshop/controller/home/home_controller.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {
          Get.toNamed(AppRoute.cart);
        },
        child: const Icon(Icons.shopping_basket_outlined),
      ),
    );
  }
}
