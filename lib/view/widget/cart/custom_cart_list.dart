import 'package:cached_network_image/cached_network_image.dart';
import 'package:happyshop/controller/cart/cart_controller_imp.dart';
import 'package:happyshop/core/constant/applink.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/data/model/mycartmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCartList extends StatelessWidget {
  const CustomCartList({super.key, required this.myCartViewModel});
  final MyCartViewModel myCartViewModel;
  @override
  Widget build(BuildContext context) {
    CartControllerImp controller = Get.put(CartControllerImp());
    controller.value = int.parse(myCartViewModel.countitems!);
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: myCartViewModel.itemsImage != null
                  ? CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageitems}/${myCartViewModel.itemsImage}",
                      height: 90,
                      fit: BoxFit.cover)
                  : Image.asset(
                      "assets/images/logoapp.png",
                      fit: BoxFit.cover,
                    )),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    myCartViewModel.itemsName!,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${myCartViewModel.itemsprice!} \$",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 20, color: AppColor.primaryColor),
                  ),
                ),
              ],
            ),
            // ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: InkWell(
                      onTap: () {
                        controller.additem(myCartViewModel.cartItemsid!);
                      },
                      child: const Icon(Icons.add)),
                ),
                GetBuilder<CartControllerImp>(
                    builder: (controller) => Text(
                          "${controller.value}",
                          style: const TextStyle(
                              fontSize: 20, color: AppColor.black),
                        )),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                      onTap: () {
                        controller.deleteitem(myCartViewModel.cartItemsid!);
                      },
                      child: const Icon(Icons.remove)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
