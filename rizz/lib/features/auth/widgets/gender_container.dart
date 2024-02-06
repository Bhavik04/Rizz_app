import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
  final String text;
  final String? imagePath;
  final double containerWidth;
  final double containerHeight;
  final Color backgroundColor;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderContainer({
    required this.text,
    required this.containerWidth,
    required this.containerHeight,
    required this.backgroundColor,
    required this.isSelected,
    required this.onTap,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          color: isSelected ? backgroundColor : Colors.white38,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            if (imagePath != null) ...[
              const SizedBox(width: 10),
              Image.asset(
                imagePath!,
                height: 25,
                width: 25,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
