import 'package:flutter/material.dart';

class CustomBodyAuth extends StatelessWidget {
  final String body;

  const CustomBodyAuth({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
      child: Text(
        body,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
