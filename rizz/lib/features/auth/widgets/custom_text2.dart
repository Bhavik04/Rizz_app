import 'package:flutter/material.dart';

class CustomSmallText extends StatelessWidget {
  final String text;

  const CustomSmallText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white70),
      textAlign: TextAlign.center,
      maxLines: 1,
    );
  }
}
