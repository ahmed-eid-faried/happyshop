import 'package:happyshop/controller/home/home_controller.dart';
import 'package:happyshop/view/widget/bottomNavigationBar/custom_button_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(controller.homePages.length, (index) {
              return index == 2
                  ? const Text("")
                  : CustomButtonAppBar(
                      homePage: controller.homePages[index],
                      index: index,
                    );
            }),
          ],
        ),
      ),
    );
  }
}
