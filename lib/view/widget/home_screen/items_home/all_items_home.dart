import 'package:happyshop/controller/home/home_screen_controller.dart';
import 'package:happyshop/view/widget/home_screen/items_home/custom_items_view_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllItemsHome extends GetView<HomeScreenControllerImp> {
  const AllItemsHome(this.list, {super.key});
  final List list;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...List.generate(
            list.length,
            (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: CustomItemsHomeView(
                  itemsModel: list[index],
                )))
      ],
    );
  }
}
