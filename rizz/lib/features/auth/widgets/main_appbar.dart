import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/widgets/custom_boost_popup.dart';
import 'package:rizz/features/auth/widgets/custom_bottomsheet.dart';
import 'package:rizz/features/auth/widgets/free_boost_popup.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      toolbarHeight: 60,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              context.goNamed('ProfileScreen');
            },
            child: Image.asset(
              'assets/images/boy.png',
              width: 35.0,
              height: 35.0,
            ),
          ),
          GestureDetector(
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
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return FreeBoostPopup();
                },
              );
            },
            child: Image.asset(
              'assets/images/freeboost.png',
              width: 35.0,
              height: 35.0,
            ),
          ),
          const Text(''),
          Padding(
            padding: EdgeInsets.only(right: GlobalVariables.deviceWidth * 0.33),
          ),
          GestureDetector(
            onTap: () {
              context.goNamed('AdswipeScreen');
            },
            child: Image.asset(
              'assets/images/instagram.png',
              width: 35.0,
              height: 35.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              showCustomBottomSheet(context);
            },
            child: Image.asset(
              'assets/images/settings.png',
              width: 35.0,
              height: 35.0,
            ),
          ),
        ],
      ),
    );
  }
}
