import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/main_appbar.dart';
import 'package:rizz/features/auth/widgets/block_sheet.dart';
import 'package:rizz/features/auth/widgets/snapchat_bottom.dart';
import 'package:rizz/features/auth/widgets/superchat.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';

class PlayScreen extends StatefulWidget {
  static const routeName = 'PlayScreen';

  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  String? referralCode;
  List<dynamic> userImageURLs = [];

  @override
  void initState() {
    super.initState();
    _loadReferralCode();
    _loadUserImages();
  }

  Future<void> _loadReferralCode() async {
    final userData = await FirestoreService().getUserData(
      AuthService().currentUser?.uid ?? '',
    );

    setState(() {
      referralCode = userData?['referralCode'];
    });
  }

  Future<void> _loadUserImages() async {
    final List<dynamic> images = await FirestoreService()
        .getAllUserImages(AuthService().currentUser?.uid ?? '');

    setState(() {
      userImageURLs = images;
    });
  }

  double _currentValue = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: MainAppBar(),
        body: Column(
          children: [
            Container(
              height: GlobalVariables.deviceHeight * 0.78,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: userImageURLs.length,
                itemBuilder: (context, index) {
                  return FutureBuilder<Map<String, dynamic>?>(
                    future: FirestoreService()
                        .getUserDataForImage(userImageURLs[index]),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final username = snapshot.data?['username'] ?? '';
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
                                  image: NetworkImage(userImageURLs[index][0]),
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
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  GlobalVariables.deviceWidth *
                                                      0.04,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RichText(
                                                  text: const TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Sobu',
                                                        style: TextStyle(
                                                          fontSize: 22.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '\n99, Nagaliya',
                                                        style: TextStyle(
                                                          fontSize: 18.0,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          // Column(
                                          //   children: [
                                          //     GestureDetector(
                                          //       onTap: () {
                                          //         showSnapchatBottom(context);
                                          //       },
                                          //       child: Padding(
                                          //         padding: EdgeInsets.only(
                                          //           right: GlobalVariables
                                          //                   .deviceWidth *
                                          //               0.02,
                                          //         ),
                                          //         child: Image.asset(
                                          //           'assets/images/Snapchat.png',
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                          Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  showSnapchatBottom(context);
                                                  // show users snap id in text instead of the snap.png if the user is premium
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: GlobalVariables
                                                              .deviceWidth *
                                                          0.02),
                                                  child: Container(
                                                    height: GlobalVariables
                                                            .deviceHeight *
                                                        0.055,
                                                    width: GlobalVariables
                                                            .deviceWidth *
                                                        0.3,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.yellow,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                            'assets/images/snap.png'),
                                                        const SizedBox(
                                                          width: 2,
                                                        ),

                                                        //show text only to premium users
                                                        // const CustomText(
                                                        //   text: '@sobuhikehde',
                                                        //   fontSize: 12,
                                                        //   fontWeight:
                                                        //       FontWeight.normal,
                                                        //   textColor:
                                                        //       Colors.black,
                                                        // )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  showSuperChat(context);

                                                  // send user directly in users chat, if user is premium otherwise ask for a 5 star rating for a free super chat
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    right: GlobalVariables
                                                            .deviceWidth *
                                                        0.04,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/superchat.png',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                      GlobalVariables.deviceWidth * 0.05,
                                      GlobalVariables.deviceHeight * 0.02,
                                      GlobalVariables.deviceWidth * 0.05,
                                      GlobalVariables.deviceHeight * 0.02,
                                    ),
                                    height: GlobalVariables.deviceHeight * 0.12,
                                    decoration: BoxDecoration(
                                      color: Colors.white38,
                                      border: Border.all(
                                          color: Colors.white24, width: 2),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        activeTrackColor: HexColor('FF6B03'),
                                        inactiveTrackColor: Colors.white,
                                        thumbColor: Colors.redAccent,
                                        trackHeight: 7,
                                        valueIndicatorColor: Colors.black,
                                        valueIndicatorTextStyle:
                                            const TextStyle(fontSize: 16),
                                      ),
                                      child: Slider(
                                        value: _currentValue,
                                        min: 0,
                                        max: 10,
                                        onChanged: (value) {
                                          setState(() {
                                            _currentValue = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 10.0,
                              right: 10.0,
                              child: GestureDetector(
                                onTap: () {
                                  showSkipSheet(context);
                                },
                                child: Image.asset(
                                  'assets/images/report.png',
                                  width: 50.0,
                                  height: 50.0,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Text('No user data available');
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
