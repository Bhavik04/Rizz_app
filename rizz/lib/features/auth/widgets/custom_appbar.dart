import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_boost_popup.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onLeftIconTap;
  final VoidCallback? onRightIconTap;

  const CustomAppBar({
    Key? key,
    this.onLeftIconTap,
    this.onRightIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: HexColor('0F0F0F'),
      toolbarHeight: 60,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
          const Text(''),
          GestureDetector(
            onTap: () {
              const String instagramLink =
                  'https://www.instagram.com/kash_2709';
              launch(instagramLink);
            },
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
  Size get preferredSize => const Size.fromHeight(60.0);
}
