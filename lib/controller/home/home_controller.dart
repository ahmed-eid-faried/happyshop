// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:happyshop/data/model/home_pages_model.dart';
import 'package:happyshop/view/screen/items/offers.dart';
import 'package:happyshop/view/screen/notifications.dart';
import 'package:happyshop/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happyshop/view/screen/home_screen/home_screen.dart';

abstract class HomeController extends GetxController {
  changePage(int index);
}

class HomeControllerImp extends HomeController {
  static int currentpage = 0;
  List<HomePagesModel> homePages = [
    HomePagesModel(title: "Home", icon: Icons.home, page: const HomeScreen()),
    HomePagesModel(
        title: "Offers", icon: Icons.local_offer_rounded, page: const Offers()),
    HomePagesModel(
        title: "spacer", icon: Icons.space_bar, page: const Text("")),
    HomePagesModel(
        title: "Notifications",
        icon: Icons.notifications,
        page: const Notifications()),
    HomePagesModel(
        title: "Settings", icon: Icons.settings, page: const Settings()),
  ];
  @override
  changePage(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
// Firebasema
    super.onInit();
  }
}
