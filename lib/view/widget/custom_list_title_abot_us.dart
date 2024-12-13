import 'package:happyshop/core/constant/fonts.dart';
import 'package:flutter/material.dart';

class CustomListTitleAbotUs extends StatelessWidget {
  final String title;
  final Function fun;

  const CustomListTitleAbotUs(
      {super.key, required this.title, required this.fun});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          onTap: () {
            fun();
          },
          title: Padding(
            padding: const EdgeInsets.only(
              top: 2.0,
            ),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: AppFonts.textStyle7,
            ),
          ),
        ),
      ),
    );
  }
}
