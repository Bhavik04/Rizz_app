import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/widgets/block_sheet.dart';

class ArrowBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color? titleColor; // New optional parameter for title color
  final VoidCallback onBack;
  final bool showReportButton;
  final EdgeInsetsGeometry textPadding;

  ArrowBar({
    required this.title,
    required this.backgroundColor,
    this.titleColor, // Provide a default value if needed, or accept null
    required this.onBack,
    this.showReportButton = true,
    this.textPadding = const EdgeInsets.all(0.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: onBack,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back,
                    size: 28.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: textPadding,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: titleColor ?? GlobalVariables.themeColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              if (showReportButton)
                GestureDetector(
                  onTap: () {
                    showSkipSheet(context, includeSkipUser: false);
                  },
                  child: Image.asset(
                    'assets/images/report.png',
                    width: 30.0,
                    height: 30.0,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
