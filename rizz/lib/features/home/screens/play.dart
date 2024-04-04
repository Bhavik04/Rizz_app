import 'dart:convert';

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

class PlayScreen extends StatefulWidget {
  static const routeName = 'PlayScreen';

  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  // List<dynamic> userImageURLs = [];
  List<AppUser> allUserData = [];
  double _currentValue = 0;

  @override
  void initState() {
    super.initState();
    _loadUserImages();
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
                      Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: Colors.white24,
                            width: 1.0,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(userImages[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  onSnapchatTap: () {
                                    showSnapchatBottom(context);
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
                      ReportButton(
                        onTap: () {
                          showSkipSheet(context);
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
