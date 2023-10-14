import 'package:happyshop/controller/home/search.dart';
import 'package:happyshop/controller/items/items_controller.dart';
import 'package:happyshop/core/class/handling_data_view.dart';
import 'package:happyshop/core/function/alertexitapp.dart';
import 'package:happyshop/view/widget/custom_search.dart';
import 'package:happyshop/view/widget/customappbar.dart';
import 'package:happyshop/view/widget/items/custom_items_view.dart';
import 'package:happyshop/view/widget/items/custom_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    Get.put(SearchControllerImp());

    return WillPopScope(
      onWillPop: backAppHome,
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GetBuilder<ItemsControllerImp>(
                builder: (controller) => GetBuilder<SearchControllerImp>(
                      builder: (searchController) => ListView(
                        children: [
                          CustomAppBar(
                              title: "Find Product",
                              controller: searchController.controllerSearch,
                              onChangedSearch: (val) =>
                                  searchController.checkSearch(),
                              onPressedSearch: () => searchController.search()),
                          const CustomItems(),
                          searchController.isSearch
                              ? const CustomSearch()
                              : HandlingDataView(
                                  paddingOfflineViewDataWidget: false,
                                  view: true,
                                  statusRequest: controller.statusRequest,
                                  child: const CustomItemsView()),
                        ],
                      ),
                    ))),
      ),
    );
  }
}
