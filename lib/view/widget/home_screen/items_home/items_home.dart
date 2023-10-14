import 'package:happyshop/controller/home/home_screen_controller.dart';
import 'package:happyshop/view/widget/home_screen/items_home/items_home_stack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsHome extends GetView<HomeScreenControllerImp> {
  const ItemsHome(this.list, {super.key});
  final List list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ItemsHomeStack(
                  itemsModel: list[index],
                ));
          },
        ));
  }
}
