import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Color buttonColor;
  final Color textColor;
  final Image? image;
  final double borderRadius;
  final double width;
  final double height;
  final double textSize;
  final double iconSize;

  const CustomButton({
    this.onTap,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    this.image,
    this.borderRadius = 40,
    this.width = 300,
    this.height = 60,
    this.textSize = 20,
    this.iconSize = 24,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          enableFeedback: false,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Ink(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (image != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                        width: iconSize,
                        height: iconSize,
                        child: image,
                      ),
                    ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.w800,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
