import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  const CustomText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 25, color: Colors.white, fontWeight: FontWeight.w900),
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }
}
