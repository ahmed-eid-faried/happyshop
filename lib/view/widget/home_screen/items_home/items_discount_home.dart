import 'package:happyshop/controller/home/home_screen_controller.dart';
import 'package:happyshop/view/widget/home_screen/items_home/customoffershome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDiscountHome extends GetView<HomeScreenControllerImp> {
  const ItemsDiscountHome(this.list, {super.key});
  final List list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 175,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0.0,
                ),
                child: CustomOffersHomeView(
                  itemsModel: list[index],
                ));
          },
        ));
  }
}
