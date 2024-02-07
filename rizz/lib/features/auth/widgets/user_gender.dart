import 'package:flutter/material.dart';

class GenderContainer extends StatefulWidget {
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
  State<GenderContainer> createState() => _GenderContainerState();
}

class _GenderContainerState extends State<GenderContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: widget.containerWidth,
        height: widget.containerHeight,
        decoration: BoxDecoration(
          color: widget.isSelected ? widget.backgroundColor : Colors.white38,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            if (widget.imagePath != null) ...[
              const SizedBox(width: 10),
              Image.asset(
                widget.imagePath!,
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
