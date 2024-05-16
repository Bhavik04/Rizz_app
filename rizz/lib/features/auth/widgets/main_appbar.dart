import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/screens/splash_screen.dart';
import 'package:rizz/features/auth/widgets/custom_boost_popup.dart';
import 'package:rizz/features/auth/widgets/custom_bottomsheet.dart';
import 'package:rizz/features/auth/widgets/free_boost_popup.dart';
import 'package:rizz/features/home/screens/ad_swipe.dart';
import 'package:rizz/features/home/screens/profile.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  String? userImageUrl;

  @override
  void initState() {
    super.initState();
    fetchCurrentUserImage();
  }

  Future<void> fetchCurrentUserImage() async {
    final List<String>? photoURLs = await FirestoreService()
        .getUserPhotoURLs(AuthService().currentUser!.uid);

    if (photoURLs != null && photoURLs.isNotEmpty) {
      setState(() {
        userImageUrl = photoURLs[0];
      });
    }
  }

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
              context.goNamed(ProfileScreen.routeName);
            },
            child: userImageUrl != null
                ? ClipOval(
                    child: Image.network(
                      userImageUrl!,
                      width: 35.0,
                      height: 35.0,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipOval(
                    child: Image.asset(
                      'assets/images/boy.png',
                      width: 35.0,
                      height: 35.0,
                      fit: BoxFit.cover,
                    ),
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
                  return const FreeBoostPopup();
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
              //context.goNamed(AdswipeScreen.routeName);
               context.goNamed(SplashScreen.routeName);
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
