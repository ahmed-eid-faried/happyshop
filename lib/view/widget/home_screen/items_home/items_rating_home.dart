import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happyshop/controller/home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happyshop/view/widget/home_screen/items_home/customratinghome.dart';

class ItemsRatingHome extends GetView<HomeScreenControllerImp> {
  const ItemsRatingHome(this.list, {super.key});
  final List list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 180.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                child: CustomRatingHomeView(
                  itemsModel: list[index],
                ));
          },
        ));
  }
}
