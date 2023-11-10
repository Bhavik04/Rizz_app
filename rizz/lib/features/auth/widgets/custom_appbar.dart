import 'package:flutter/material.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_bottomsheet.dart';
import 'package:rizz/features/auth/widgets/custom_popup.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onLeftIconTap;
  final VoidCallback onRightIconTap;

  const CustomAppBar({
    Key? key,
    required this.onLeftIconTap,
    required this.onRightIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: HexColor('141414'),
      toolbarHeight: 80,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDialog(
                    onButtonTap: (buttonText) {
                      debugPrint('$buttonText button tapped');
                    },
                  );
                },
              );
            },
            child: Image.asset(
              'assets/images/blast.png',
              width: 40.0,
              height: 40.0,
            ),
          ),
          const Text(''),
          InkWell(
            onTap: () {
              showCustomBottomSheet(context);
            },
            child: Image.asset(
              'assets/images/settings.png',
              width: 40.0,
              height: 40.0,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
