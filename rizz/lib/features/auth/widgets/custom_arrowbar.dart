import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/widgets/block_sheet.dart';

class ArrowBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color? titleColor;
  final VoidCallback onBack;
  final bool showReportButton;
  final bool showCrossIcon;
  final EdgeInsetsGeometry textPadding;

  const ArrowBar({
    super.key,
    required this.title,
    required this.backgroundColor,
    this.titleColor,
    required this.onBack,
    this.showReportButton = false,
    this.showCrossIcon = false,
    this.textPadding = const EdgeInsets.all(0.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onBack,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  showCrossIcon ? Icons.close : Icons.arrow_back,
                  size: 28.0,
                  color: Colors.white70,
                ),
              ),
            ),
            Expanded(
              child: Center(
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
            ),
            if (showReportButton)
              GestureDetector(
                onTap: () {
                  showSkipSheet(context, includeSkipUser: false);
                },
                child: const Icon(
                  Icons.report,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
