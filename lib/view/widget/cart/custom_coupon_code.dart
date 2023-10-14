import 'package:happyshop/controller/cart/cart_controller_imp.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCouponCode extends StatelessWidget {
  const CustomCouponCode({
    super.key,
    required this.size,
  });

  final Appsize size;

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return GetBuilder<CartControllerImp>(
        builder: (controller) => controller.couponVal != 0
            ? Container(
                child: Center(
                  child: Text(
                    "Coupon Code ${controller.couponModel!.couponName!}",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : Row(
                children: [
                  SizedBox(
                    width: Get.width*0.65,
                    child: TextFormField(
                      controller: controller.controllercouponname,
                      decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          hintText: "Coupon",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      controller.coupon();
                    },
                    child: Container(
                      width: Get.width*0.22,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColor.secondColor),
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Apply",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    ),
                  )
                ],
              ));
  }
}
