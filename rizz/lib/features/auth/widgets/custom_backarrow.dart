import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';

class ArrowAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBack;

  const ArrowAppBar({super.key, required this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: GlobalVariables.themeColor,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 30,
          color: Colors.white,
        ),
        onPressed: onBack ?? () => Navigator.of(context).pop(),
      ),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
