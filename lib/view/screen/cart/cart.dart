import 'package:happyshop/controller/cart/cart_controller_imp.dart';
import 'package:happyshop/core/class/handling_data_view.dart';
import 'package:happyshop/data/model/mycartmodel.dart';
import 'package:happyshop/view/widget/cart/custom_button_cart.dart';
import 'package:happyshop/view/widget/cart/custom_cart_list.dart';
import 'package:happyshop/view/widget/cart/custom_title_cart.dart';
import 'package:happyshop/view/widget/cart/custom_top_app_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(
      bottomNavigationBar: const CustomButtonCart(),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            const CustomTopAppCart(),
            const CustomTitleCart(),
            GetBuilder<CartControllerImp>(
              builder: (controller) => HandlingDataView(
                view: true,
                statusRequest: controller.statusRequest,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.myCartViewList.length,
                  itemBuilder: (context, index) {
                    MyCartViewModel myCartViewModel =
                        controller.myCartViewList[index];
                    return CustomCartList(myCartViewModel: myCartViewModel);
                  },
                ),
              ),
            )
          ],
        ),
        // )
      ),
    );
  }
}
