import 'package:happyshop/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextNivagtorAuth extends StatelessWidget {
  final String text1;
  final String text2;
  final Function() ontap;

  const CustomTextNivagtorAuth(
      {super.key, required this.text1, required this.text2, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text2),
        InkWell(
          onTap: ontap,
          child: Text(
            text1,
            style: const TextStyle(color: AppColor.primaryColor),
          ),
        ),
      ],
    );
  }
}
