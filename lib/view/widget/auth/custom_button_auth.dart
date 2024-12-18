import 'package:happyshop/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButtonAuth(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: Colors.white,
      color: AppColor.primaryColor,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Text(text),
    );
  }
}
