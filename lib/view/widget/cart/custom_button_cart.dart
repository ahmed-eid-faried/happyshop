import 'package:happyshop/controller/cart/cart_controller_imp.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/constant/sizes.dart';
import 'package:happyshop/view/widget/cart/custom_coupon_code.dart';
import 'package:happyshop/view/widget/cart/custom_row_title_cart.dart';
import 'package:happyshop/view/widget/custom_button_cart_and_chechout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonCart extends StatelessWidget {
  const CustomButtonCart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    Appsize size = Appsize();
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: GetBuilder<CartControllerImp>(
        builder: (controller) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomCouponCode(size: size),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.primaryColor)),
              child: Column(
                children: [
                  CustomRowTitleCart(
                    title: "Price",
                    value: "${controller.price} \$",
                  ),
                  const SizedBox(height: 10),
                  CustomRowTitleCart(
                    title: "Coupon",
                    value: "${controller.couponVal} %",
                  ),
                  const SizedBox(height: 10),
                  CustomRowTitleCart(
                    title: "Shipping",
                    value: "${controller.shipping} \$",
                  ),
                  const SizedBox(height: 5),
                  const Divider(color: AppColor.primaryColor),
                  const SizedBox(height: 5),
                  CustomRowTitleCart(
                    title: "Total",
                    value: "${controller.total}",
                    color: true,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButtonCartAndChechout(
                title: "Place Order",
                onTap: () {
                  controller.goToCheckout();
                })
          ],
        ),
      ),
    );
  }
}
