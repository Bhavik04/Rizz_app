import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/db/modals/user.dart';
import 'package:rizz/db/services/database_service.dart';
import 'package:rizz/features/auth/widgets/block_sheet.dart';
import 'package:rizz/features/auth/widgets/main_appbar.dart';
import 'package:rizz/features/auth/widgets/custom_slider.dart';
import 'package:rizz/features/auth/widgets/report_button.dart';
import 'package:rizz/features/auth/widgets/snap_superchat.dart';
import 'package:rizz/features/auth/widgets/snapchat_bottom.dart';
import 'package:rizz/features/auth/widgets/superchat.dart';
import 'package:rizz/features/auth/widgets/user_info_texts.dart';
import 'package:rizz/objectbox.g.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:rizz/services/notifications.dart';

class PlayScreen extends StatefulWidget {
  static const routeName = 'PlayScreen';

  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  // List<dynamic> userImageURLs = [];
  List<AppUser> allUserData = [];
  late PageController _pageController;
  double _currentValue = 0;
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    _loadUserImages();
    _pageController = PageController();
    notificationServices.requestNotificationPermission();
    notificationServices.setupInteractMessage(context);
    notificationServices.firebaseInit(context);
    notificationServices.isRefreshToken();
    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Future<List<AppUser>> _loadUserImages() async {
  void _loadUserImages() async {
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();

    // final List<dynamic> images = await FirestoreService()
    //     .getAllUserImages(AuthService().currentUser?.uid ?? '');
    Store store = databaseService.getStore()!;

    setState(() {
      allUserData = store
          .box<AppUser>()
          .query(AppUser_.uId.notEquals(AuthService().currentUser!.uid))
          .build()
          .find();
      // userImageURLs = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: MainAppBar(),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: GlobalVariables.deviceHeight * 0.79,
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                itemCount: allUserData.length,
                itemBuilder: (context, index) {
                  AppUser user = allUserData[index];
                  // return FutureBuilder<List<AppUser>>(
                  //   future: _loadUserImages(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return const CircularProgressIndicator();
                  //     } else if (snapshot.hasError) {
                  //       return Text('Error: ${snapshot.error}');
                  //     } else if (snapshot.hasData) {
                  //       // final username = snapshot.data?['username'] ?? '';
                  //       // final age = snapshot.data?['age'] ?? 0;
                  final username = user.name ?? '';
                  final age = user.age ?? 0;
                  final userImages = jsonDecode(user.imageUrls);
                  return Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: userImages[0],
                        imageBuilder: (context, imageProvider) => Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Colors.white24,
                              width: 1.0,
                            ),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      UserInfoWidget(
                                        username: username,
                                        age: age,
                                      ),
                                    ],
                                  ),
                                  CustomButtonsColumn(
                                    onSnapchatTap: () async {
                                      //showSnapchatBottom(context);
                                      String snapId = user.snapId ?? '';

                                      // Construct the dynamic Snapchat profile URL
                                      String snapchatProfileUrl =
                                          'https://www.snapchat.com/add/$snapId';

                                      // Launch the URL
                                      if (await canLaunch(snapchatProfileUrl)) {
                                        await launch(snapchatProfileUrl);
                                      } else {
                                        throw 'Could not launch Snapchat profile';
                                      }
                                    },
                                    onSuperChatTap: () {
                                      showSuperChat(context);
                                    },
                                  ),
                                ],
                              ),
                              CustomSlider(
                                value: _currentValue,
                                onChanged: (value) {
                                  FirestoreService()
                                      .sendRating(user, value.toInt());

                                  setState(() {
                                    _currentValue = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      ReportButton(
                        onTap: () {
                          showSkipSheet(context, onSkip: () {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          });
                        },
                      ),
                    ],
                  );

                  //     } else {
                  //       return const Text('No user data available');
                  //     }
                  //   },
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
