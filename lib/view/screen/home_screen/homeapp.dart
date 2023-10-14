import 'package:happyshop/controller/home/home_controller.dart';
import 'package:happyshop/core/function/alertexitapp.dart';
import 'package:happyshop/view/widget/bottomNavigationBar/custom_bottom_app_bar.dart';
import 'package:happyshop/view/widget/bottomNavigationBar/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => WillPopScope(
              onWillPop: alertExitApp,
              child: Scaffold(
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  floatingActionButton: const CustomFloatingActionButton(),
                  bottomNavigationBar: const CustomBottomAppBar(),
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: controller
                            .homePages[HomeControllerImp.currentpage].page),
                  )),
            ));
  }
}
