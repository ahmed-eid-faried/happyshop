import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/payments/paypal.dart';
import 'package:happyshop/core/payments/stripe.dart';
import 'package:happyshop/core/payments/custom_apple_pay.dart';
import 'package:happyshop/core/payments/custom_google_pay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happyshop/controller/cart/paymentpagecontroller.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});
  @override
  Widget build(BuildContext context) {
    PaymentPageController controller = Get.put(PaymentPageController());
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Select The Method Of Payment",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 22,
            fontWeight: FontWeight.bold),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            TextButton(
              onPressed: () => PaymentManager.makePayment(
                  controller.total!.ceil(),
                  "USD",
                  "us",
                  (() => controller.checkoutRequestData())),
              child: const Text(
                'Stripe',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                paypal(
                    amount: controller.total!.ceil(),
                    currency: "USD",
                    countryCode: "EG",
                    shipping: controller.pricedelivery,
                    couponVal: controller.couponVal,
                    items: controller.myCartViewList,
                    onConform: () {
                      controller.checkoutRequestData();
                    });
              },
              child: Text(
                'PayPal',
                style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            if (GetPlatform.isIOS)
              CustomApplePay(
                price: controller.total!.ceil().toString(),
                shipping: controller.pricedelivery,
                couponVal: controller.couponVal,
                items: controller.myCartViewList,
                checkoutRequestData: () {
                  controller.checkoutRequestData();
                },
                currencyCode: "USD",
                countryCode: "EG",
              ),
            if (GetPlatform.isAndroid)
              CustomGooglePay(
                price: controller.total!.ceil().toString(),
                shipping: controller.pricedelivery,
                couponVal: controller.couponVal,
                items: controller.myCartViewList,
                checkoutRequestData: () {
                  controller.checkoutRequestData();
                },
                currencyCode: "USD",
                countryCode: "EG",
              )
          ],
        ),
      ),
    );
  }
}
