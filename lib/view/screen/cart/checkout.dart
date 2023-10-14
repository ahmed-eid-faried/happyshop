import 'package:happyshop/controller/cart/checkout_controller.dart';
import 'package:happyshop/core/constant/imgaeasset.dart';
import 'package:happyshop/view/widget/checkout/custom_choose_delivery_type.dart';
import 'package:happyshop/view/widget/checkout/custom_payment_method.dart';
import 'package:happyshop/view/widget/checkout/custom_shipping_address.dart';
import 'package:happyshop/view/widget/checkout/custom_title.dart';
import 'package:happyshop/view/widget/custom_button_cart_and_chechout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        bottomNavigationBar: CustomButtonCartAndChechout(
            title: "Checkout",
            padding: 10,
            onTap: () {
              controller.checkout();
            }),
        appBar: AppBar(
          title: const Text("Checkout"),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: GetBuilder<CheckoutController>(
          builder: (controller) => ListView(
            children: [
              const CustomTitle(title: "Choose Payment Method"),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPaymentMethod(
                    title: "Cash",
                    val: "0",
                  ),
                  CustomPaymentMethod(
                    title: "Payment Cards",
                    val: "1",
                  ),
                ],
              ),
              const CustomTitle(title: "Choose Delivery Type"),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomChooseDeliveryType(
                    title: "delivery",
                    image: AppImageAsset.delivery,
                    val: "0",
                  ),
                  CustomChooseDeliveryType(
                    title: "drivethru",
                    image: AppImageAsset.drivethru,
                    val: "1",
                  ),
                ],
              ),
              controller.deliverySelector == "0"
                  ? const CustomShippingAddress()
                  : const Text(""),
            ],
          ),
        ));
  }
}
