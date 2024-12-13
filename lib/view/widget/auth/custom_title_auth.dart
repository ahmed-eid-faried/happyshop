import 'package:flutter/material.dart';

class CustomTitleAuth extends StatelessWidget {
  final String title;
  const CustomTitleAuth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 2.0,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
