import 'package:happyshop/controller/favorite/my_favorite_view_controller.dart';
import 'package:happyshop/controller/home/search.dart';
import 'package:happyshop/core/class/handling_data_view.dart';
import 'package:happyshop/view/widget/custom_my_favorite_view/custom_my_favorite_view.dart';
import 'package:happyshop/view/widget/custom_search.dart';
import 'package:happyshop/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteViewControllerImp());
    Get.put(SearchControllerImp());
    return Scaffold(
        body: GetBuilder<MyFavoriteViewControllerImp>(
      builder: (controller) => GetBuilder<SearchControllerImp>(
        builder: (searchController) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(children: [
            CustomAppBar(
                title: "Find Product",
                controller: searchController.controllerSearch,
                onChangedSearch: (val) => searchController.checkSearch(),
                onPressedSearch: () => searchController.search()),
            searchController.isSearch
                ? const CustomSearch()
                : HandlingDataView(
                    paddingOfflineViewDataWidget: false,
                    view: true,
                    statusRequest: controller.statusRequest,
                    child: const CustomMyFavoriteView())
          ]),
        ),
      ),
    ));
  }
}
