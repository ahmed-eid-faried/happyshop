import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/constant/fonts.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/data/model/address_data_model.dart';
import 'package:happyshop/view/widget/checkout/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happyshop/controller/cart/checkout_controller.dart';

class CustomShippingAddress extends StatelessWidget {
  const CustomShippingAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());

    return GetBuilder<CheckoutController>(
      builder: (controller) => controller.data.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoute.addaddress);
                  },
                  child: const Center(
                      child: Text(
                    "Please Add Shipping Address  \n Click Here",
                    textAlign: TextAlign.center,
                    style: AppFonts.textStyle9,
                  ))),
            )
          : Column(
              children: [
                const CustomTitle(title: "Shipping Address"),
                ...List.generate(controller.data.length, (index) {
                  AddressDataModel addressDataModel = controller.data[index];
                  return Card(
                    color: controller.isActive(addressDataModel)
                        ? AppColor.primaryColor
                        : null,
                    child: ListTile(
                        onTap: () {
                          controller.select(addressDataModel);
                        },
                        leading: Icon(
                          Icons.location_on,
                          size: 30,
                          color: controller.isActive(addressDataModel)
                              ? Colors.white
                              : AppColor.primaryColor,
                        ),
                        title: Text(addressDataModel.addressName!,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20,
                              color: controller.isActive(addressDataModel)
                                  ? Colors.white
                                  : AppColor.grey,
                            ),
                            maxLines: 1),
                        subtitle: Text(
                            "${addressDataModel.addressCity!} ${addressDataModel.addressStreet!}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: controller.isActive(addressDataModel)
                                  ? Colors.white
                                  : AppColor.grey,
                            ),
                            maxLines: 3)),
                  );
                })
              ],
            ),
    );
  }
}
