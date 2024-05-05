import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/db/services/database_service.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/auth/widgets/new_card_widget.dart';
import 'package:rizz/features/auth/widgets/custom_appbar.dart';
import 'package:rizz/features/home/screens/play.dart';
import 'package:rizz/features/home/screens/subscription.dart';
import 'package:rizz/objectbox.g.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';
import 'package:rizz/services/notifications.dart';
import 'package:http/http.dart' as http;

class InboxScreen extends StatefulWidget {
  static const routeName = 'InboxScreen';
  final String id;

  const InboxScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  var ratings;
  NotificationServices notificationServices = NotificationServices();

  void getLikedProfiles() async {
    // DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    // Store store = databaseService.getStore()!;

    // setState(() {
    //   allUserData = store
    //       .box<AppUser>()
    //       .query(AppUser_.uId.notEquals(AuthService().currentUser!.uid))
    //       .build()
    //       .find();
    //   // userImageURLs = images;
    // });

    var response = await FirestoreService()
        .firestore
        .collection('rating')
        .doc(AuthService().currentUser!.uid)
        .get();
    setState(() {
      ratings = response.data();
    });
  }

  @override
  void initState() {
    super.initState();
    getLikedProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: GlobalVariables.deviceHeight * 0.02,
              left: GlobalVariables.deviceWidth * 0.05,
            ),
            child: const CustomText(
              text: 'Your ratings',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              textColor: Colors.white,
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: FirestoreService()
                    .firestore
                    .collection('rating')
                    .doc(AuthService().currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    if (snapshot.hasData && snapshot.data!.exists) {
                      Map<String, dynamic> data = snapshot.data!.data() ?? {};

                      Map<String, int> ratings = data.map((key, value) =>
                          MapEntry(key, int.parse(value as String)));
                      return ListView.builder(
                        itemCount: ratings.length,
                        itemBuilder: (context, index) {
                          String uId = ratings.keys.toList()[index];
                          int rating = ratings[uId]!;
                          String ratingString = rating.toString();
                          return NewCardWidget(
                            uId: uId,
                            rating: ratingString,
                          );
                        },
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomText(
                              text: 'Oops! looks like you got no ratings yet',
                              alignment: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: GlobalVariables.deviceHeight * 0.05),
                            alignment: Alignment.center,
                            child: CustomButton(
                              onTap: () {
                                context.goNamed(PlayScreen.routeName);
                              },
                              text: 'Start rating',
                              buttonColor: GlobalVariables.themeColor,
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      );
                    }
                  }
                },
              ),
              Positioned(
                bottom: 30.0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    CustomButton(
                      onTap: () {
                        // context.goNamed(SubscriptionScreen.routeName);
                        notificationServices
                            .getDeviceToken()
                            .then((value) async {
                          var data = {
                            'to':
                                'fKtAAOxgTOCOjIWqdGyqs6:APA91bEeYa633wpdeUZzLKPEH9wixTCjvITRdvSzls7fppkkrQptMACWCj2bYEdqIBU2zowDka_YLgUrDnDj0HEOhxG4uCdaKRgJ-sOQEVhZk62gmFz3eOiek8r8TxKtNLQIyjvByBMT',
                            'priority': 'high',
                            'notification': {
                              'title': 'Rate',
                              'body': 'new rating',
                            },
                            'data': {
                              'type': 'slay',
                            }
                          };
                          await http.post(
                            Uri.parse(
                              'https://fcm.googleapis.com/fcm/send',
                            ),
                            body: jsonEncode(data),
                            headers: {
                              'Content-Type': 'application/json; charset=UTF-8',
                              'Authorization':
                                  'key=AAAAj42XAjM:APA91bG0mcKrbnQblice5h2NgZGaSvhIinp51zwolVm48pcmw_ICghr0rMv3uA4Teb2UTIuIOd_VoNG7mFdnLsQJmacJ5qmezJQw9WQET96qaravSS8jbhMmgfQNoFGlRsedFtqz2Sqg',
                            },
                          );
                        });
                      },
                      text: 'See who likes you',
                      image: Image.asset('assets/images/likesyou.png'),
                      buttonColor: HexColor('F24139'),
                      textColor: Colors.white,
                      width: GlobalVariables.deviceWidth * 0.8,
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
