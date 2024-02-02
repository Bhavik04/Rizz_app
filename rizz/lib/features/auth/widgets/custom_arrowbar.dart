import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/widgets/custom_sheet.dart';

class ArrowBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final VoidCallback onBack;
  final bool showReportButton;

  ArrowBar({
    required this.title,
    required this.backgroundColor,
    required this.onBack,
    this.showReportButton = true,
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
              IconButton(
                icon: const Icon(Icons.arrow_back, size: 28.0),
                onPressed: onBack,
                color: Colors.white,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: GlobalVariables.themeColor,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (showReportButton)
                InkWell(
                  onTap: () {
                    showSimpleBottomSheet(context);
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
