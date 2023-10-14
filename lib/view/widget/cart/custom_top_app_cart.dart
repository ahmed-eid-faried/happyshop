import 'package:happyshop/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTopAppCart extends StatelessWidget {
  const CustomTopAppCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, color: AppColor.grey)),
        ),
        const Spacer(),
        const Center(
          child: Text(
            "My Cart",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColor.grey),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
