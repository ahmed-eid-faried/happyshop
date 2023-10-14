import 'package:happyshop/controller/home/home_screen_controller.dart';
import 'package:happyshop/controller/home/search.dart';
import 'package:happyshop/core/class/handling_data_view.dart';
import 'package:happyshop/view/widget/custom_search.dart';
import 'package:happyshop/view/widget/home_screen/custom_offers_home.dart';
import 'package:happyshop/view/widget/home_screen/custom_title_of_section_home.dart';
import 'package:happyshop/view/widget/customappbar.dart';
import 'package:happyshop/view/widget/home_screen/custom_catogeries/customcatogeries.dart';
import 'package:happyshop/view/widget/home_screen/items_home/all_items_home.dart';
import 'package:happyshop/view/widget/home_screen/items_home/items_discount_home.dart';
import 'package:happyshop/view/widget/home_screen/items_home/items_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happyshop/view/widget/home_screen/items_home/items_rating_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    Get.put(SearchControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GetBuilder<SearchControllerImp>(
                  builder: (searchController) => ListView(
                    children: [
                      CustomAppBar(
                          title: "Find Product",
                          controller: searchController.controllerSearch,
                          onChangedSearch: (val) =>
                              searchController.checkSearch(),
                          onPressedSearch: () => searchController.search()),
                      searchController.isSearch
                          ? const CustomSearch()
                          : Column(children: [
                              (controller.title == "" && controller.body == "")
                                  ? const SizedBox(height: 10)
                                  : CustomOffersHome(
                                      title: controller.title,
                                      body: controller.body),
                              const CustomTitleOfSectionHome(
                                  title: "Catogeries"),
                              const CustomCatogeries(),
                              const CustomTitleOfSectionHome(
                                  title: "Top Selling"),
                              ItemsHome(controller.topSelling),
                              const CustomTitleOfSectionHome(
                                  title: "Best Discount"),
                              ItemsDiscountHome(controller.itemsdiscount),
                              const CustomTitleOfSectionHome(
                                  title: "Top Rating"),
                              ItemsRatingHome(controller.topRating),
                              const SizedBox(height: 20),
                              const CustomTitleOfSectionHome(
                                  title: "Product For You"),
                              AllItemsHome(controller.items),
                            ]),
                    ],
                  ),
                ),
              ),
            ));
  }
}
