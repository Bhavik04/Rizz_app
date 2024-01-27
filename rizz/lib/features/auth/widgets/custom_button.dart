import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Color buttonColor;
  final Color textColor;

  const CustomButton({
    this.onTap,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: buttonColor,
        shadowColor: Colors.black,
        minimumSize: const Size(320, 60),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
      ),
    );
  }
}
