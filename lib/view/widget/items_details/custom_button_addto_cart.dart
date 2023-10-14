import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAddtoCart extends StatelessWidget {
  const CustomButtonAddtoCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.cart);
      },
      child: Container(
        margin: const EdgeInsets.all(15.0),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: AppColor.secondColor,
            borderRadius: BorderRadius.circular(10)),
        child: const Center(
            child: Text(
          "Go To Card",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
