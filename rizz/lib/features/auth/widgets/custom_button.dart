import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Color buttonColor;
  final Color textColor;
  final Image? image;

  const CustomButton({
    this.onTap,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 60,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          enableFeedback: false,
          borderRadius: BorderRadius.circular(40),
          child: Ink(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (image != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: image,
                    ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
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
