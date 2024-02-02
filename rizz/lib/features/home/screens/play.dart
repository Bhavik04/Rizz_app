import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_boost_popup.dart';
import 'package:rizz/features/auth/widgets/custom_bottomsheet.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_sheet.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';
import 'package:flutter/services.dart';

class PlayScreen extends StatefulWidget {
  static const routeName = 'PlayScreen';

  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  String? referralCode;
  List<String> userImageURLs = [];

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
    final List<String> images = await FirestoreService()
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
        backgroundColor: HexColor("141414"),
        appBar: AppBar(
          backgroundColor: HexColor('141414'),
          toolbarHeight: 60,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  context.goNamed('ProfileScreen');
                },
                child: Image.asset(
                  'assets/images/boy.png',
                  width: 35.0,
                  height: 35.0,
                ),
              ),
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
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: HexColor('2C2C3C'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                            color: HexColor('F9551F'),
                            width: 4.0,
                          ),
                        ),
                        content: Container(
                          alignment: Alignment.center,
                          height: GlobalVariables.deviceHeight * 0.560,
                          width: 260.0,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: GlobalVariables.deviceHeight * 0.01),
                                width: GlobalVariables.deviceWidth * 0.70,
                                child: Text(
                                  'Mini Boost',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w900,
                                      color: HexColor('FD630F')),
                                ),
                              ),
                              SizedBox(
                                width: GlobalVariables.deviceWidth * 0.70,
                                child: Text(
                                  'Invite friend to get a free mini boost',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: HexColor('FFFFFF')),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: GlobalVariables.deviceHeight * 0.08),
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/boost.png'),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: GlobalVariables.deviceHeight * 0.02),
                                height: GlobalVariables.deviceHeight * 0.05,
                                width: GlobalVariables.deviceWidth * 0.35,
                                decoration: BoxDecoration(
                                  color: HexColor('626262'),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '$referralCode',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () async {
                                        await Clipboard.setData(ClipboardData(
                                            text: "$referralCode"));
                                      },
                                      child: const Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: GlobalVariables.deviceHeight * 0.03),
                                child: CustomButton(
                                    text: 'Invite friend',
                                    onTap: () {
                                      debugPrint('Print button tapped');
                                      // context.goNamed(ChatScreen.routeName);
                                    },
                                    buttonColor: HexColor('F24139'),
                                    textColor: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
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
                padding:
                    EdgeInsets.only(right: GlobalVariables.deviceWidth * 0.33),
              ),
              InkWell(
                onTap: () {
                  context.goNamed('AdswipeScreen');
                },
                child: Image.asset(
                  'assets/images/instagram.png',
                  width: 35.0,
                  height: 35.0,
                ),
              ),
              InkWell(
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
          //actions: const [],
        ),
        body: Column(
          children: [
            Container(
              height: GlobalVariables.deviceHeight * 0.79,
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
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Colors.white24,
                                  width: 1.0,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(userImageURLs[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Positioned(
                                    bottom: 80.0,
                                    left: 0,
                                    right: 0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                GlobalVariables.deviceWidth *
                                                    0.04,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                        fontSize: 20.0,
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
                                      color: Colors.white24,
                                      border: Border.all(
                                          color: Colors.white24, width: 1),
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
                                            TextStyle(fontSize: 16),
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
                              child: InkWell(
                                onTap: () {
                                  showSimpleBottomSheet(context);
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
