 import 'package:happyshop/controller/home/search.dart';
import 'package:happyshop/controller/offers_controller_imp.dart';
import 'package:happyshop/core/class/handling_data_view.dart';
import 'package:happyshop/view/widget/items/offers/customoffers.dart';
import 'package:happyshop/view/widget/custom_search.dart';
import 'package:happyshop/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SearchControllerImp());
    Get.put(OffersControllerImp());
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GetBuilder<SearchControllerImp>(
            builder: (searchController) => ListView(
              children: [
                CustomAppBar(
                    title: "Find Product",
                    controller: searchController.controllerSearch,
                    onChangedSearch: (val) => searchController.checkSearch(),
                    onPressedSearch: () => searchController.search()),
                searchController.isSearch
                    ? const CustomSearch()
                    : GetBuilder<OffersControllerImp>(
                        builder: (controllerK) => HandlingDataView(
                            paddingOfflineViewDataWidget: false,
                            view: true,
                            statusRequest: controllerK.statusRequest,
                            child: const CustomOffersView()),
                      )
              ],
            ),
          )),
    );
  }
}
