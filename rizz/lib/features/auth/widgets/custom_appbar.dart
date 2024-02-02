import 'package:flutter/material.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_boost_popup.dart';

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
      toolbarHeight: 60,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomBoostPopup(
                    onButtonTap: () {
                      debugPrint('Button tapped');
                    },
                  );
                },
              );
            },
            child: Image.asset(
              'assets/images/boost_icon.png',
              width: 35.0,
              height: 35.0,
            ),
          ),
          const Text(''),
          InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/images/instagram.png',
              width: 35.0,
              height: 35.0,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
