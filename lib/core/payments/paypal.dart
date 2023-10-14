import 'package:happyshop/core/payments/payment_keys.dart';
import 'package:happyshop/data/model/mycartmodel.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';
 
paypal({
  required int amount,
  required String currency,
  required String countryCode,
  required String shipping,
  required double? couponVal,
  required List<MyCartViewModel> items,
  required Function onConform,
}) {
  List<Map> itemsList = [
    for (var item in items)
      {
        "name": item.itemsName,
        "quantity": int.parse(item.countitems ?? '0'),
        "price": (double.parse(item.finalpriceofoneitem!) -
                (((couponVal ?? 0) * double.parse(item.finalpriceofoneitem!)) /
                    100))
            .ceil()
            .toString(),
        "currency": currency,
      }
  ];
  print("==========================================");
  print("couponVal:- $couponVal");
  print("amount:- $amount");
  print("itemsCount:- ${items[0].countitems}");
  print("itemsList:- $itemsList");
  print("==========================================");

  Get.to(
    () => SafeArea(
      child: PaypalCheckout(
        sandboxMode: true,
        clientId: ApiKeys.clientIdPaypal,
        secretKey: ApiKeys.secretKeyPaypal,
        returnURL: "success.amadytech.com",
        cancelURL: "cancel.amadytech.com",
        transactions: [
          {
            "amount": {
              "total": amount.toString(),
              "currency": currency,
              "details": {
                "subtotal": amount.toString(),
                "shipping": shipping,
                "shipping_discount": 0,
              },
            },
            "payment_options": const {
              "allowed_payment_method": "INSTANT_FUNDING_SOURCE",
            },
            "description": "The payment transaction description.",
            "item_list": {
              "items": itemsList,
            },
          }
        ],
        note: "by ecommerce",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          onConform();
        },
        onError: (error) {
          print("onError: $error");
          Get.back();
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ),
  );
}
