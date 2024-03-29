import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomText({
    Key? key,
    required this.text,
    this.alignment,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 25,
        color: textColor ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.w900,
      ),
      textAlign: alignment ?? TextAlign.center,
      maxLines: 2,
    );
  }
}
