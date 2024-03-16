import 'package:flutter/material.dart';

class ReportButton extends StatelessWidget {
  final VoidCallback onTap;

  const ReportButton({super.key, 
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.0,
      right: 10.0,
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          'assets/images/report.png',
          width: 50.0,
          height: 50.0,
        ),
      ),
    );
  }
}
