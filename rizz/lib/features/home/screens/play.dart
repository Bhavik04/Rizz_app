import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_bottomsheet.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/snapchat_bottom.dart';
import 'package:rizz/features/home/screens/chat.dart';
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

  @override
  void initState() {
    super.initState();
    _loadReferralCode();
  }

  Future<void> _loadReferralCode() async {
    // Fetch user data from Firestore
    final userData = await FirestoreService().getUserData(
      AuthService().currentUser?.uid ?? '',
    );

    // Extract referral code
    setState(() {
      referralCode = userData?['referralCode'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("141414"),
        appBar: AppBar(
          backgroundColor: HexColor('141414'),
          toolbarHeight: 80,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  context.goNamed('ProfileScreen');
                },
                child: Image.asset(
                  'assets/images/boy.png',
                  width: 40.0,
                  height: 40.0,
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
                                    'Boost',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w900,
                                        color: HexColor('FD630F')),
                                  )),
                              SizedBox(
                                width: GlobalVariables.deviceWidth * 0.70,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Be the #1 profile',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          color: HexColor('FFFFFF')),
                                    ),
                                    const SizedBox(width: 5),
                                    Image.asset('assets/images/hot.png')
                                  ],
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
                                    top: GlobalVariables.deviceHeight * 0.03),
                                width: GlobalVariables.deviceWidth * 0.70,
                                child: Text(
                                  'Get unlimited boosts & 10x messages',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      color: HexColor('FFFFFF')),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: GlobalVariables.deviceHeight * 0.03),
                                child: CustomButton(
                                    text: 'Boost',
                                    onTap: () {
                                      debugPrint('Print button tapped');
                                      context.goNamed(ChatScreen.routeName);
                                    },
                                    buttonColor: HexColor('F24139'),
                                    textColor: Colors.white),
                              ),
                              //              Container(
                              //              margin: EdgeInsets.only(
                              //                top: GlobalVariables.deviceHeight * 0.03),
                              //          child: ElevatedButton(
                              //          style: ElevatedButton.styleFrom(
                              //          elevation: 5,
                              //        backgroundColor: HexColor('F24139'),
                              //      shadowColor: Colors.black,
                              //    minimumSize: const Size(300, 60),
                              //  shape: const RoundedRectangleBorder(
                              //  borderRadius:
                              //    BorderRadius.all(Radius.circular(40)),
                              //                    ),
                              //                ),
                              //              onPressed: () {
                              //              Navigator.pop(context);
                              //            Navigator.pushNamed(context, ChatScreen.routeName)
                              //        },
                              //      child: const Text(
                              //      'Boost',
                              //    style: TextStyle(
                              //    fontSize: 20,
                              //  fontWeight: FontWeight.w800,
                              //color: Colors.white,
                              //                 ),
                              //             ),
                              //         ),
                              //      ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Image.asset(
                  'assets/images/boost_icon.png',
                  width: 40.0,
                  height: 40.0,
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
                                    'Free Boost',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w900,
                                        color: HexColor('FD630F')),
                                  )),
                              SizedBox(
                                width: GlobalVariables.deviceWidth * 0.70,
                                child: Text(
                                  'Invite friend to get a free boost',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
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
                  width: 40.0,
                  height: 40.0,
                ),
              ),
              const Text(''),
              Padding(
                padding:
                    EdgeInsets.only(right: GlobalVariables.deviceWidth * 0.33),
              ),
              InkWell(
                onTap: () {
                  showSnapchatBottom(context);
                },
                child: Image.asset(
                  'assets/images/instagram.png',
                  width: 45.0,
                  height: 45.0,
                ),
              ),
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
          //actions: const [],
        ),
      ),
    );
  }
}
