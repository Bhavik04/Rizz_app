import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/db/modals/user.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/free_reveal.dart';
import 'package:rizz/features/home/screens/revealed_screen.dart';
import 'package:rizz/services/user_services.dart';

class BlurredScreen extends StatefulWidget {
  static const routeName = 'BlurredScreen';
  String uId;
  String rating;

  BlurredScreen({super.key, required this.uId, required this.rating});

  @override
  State<BlurredScreen> createState() => _BlurredScreenState();
}

class _BlurredScreenState extends State<BlurredScreen> {
  late AppUser user;
  void getUserDetails() {
    UserServices userServices = GetIt.instance.get<UserServices>();
    user = userServices.getUserByUid(widget.uId);
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    final userImages = jsonDecode(user.imageUrls);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 20.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      child: Image.network(
                        userImages[0],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // child: Image.asset(
                      //   'assets/images/eww.png',
                      //   width: double.infinity,
                      //   height: double.infinity,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                    Positioned(
                      top: GlobalVariables.deviceHeight * 0.15,
                      left: 0,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'A ${user.age} year old ${user.gender} from New Delhi',
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: GlobalVariables.deviceHeight * 0.07),
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Rated you:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30.0,
                                  ),
                                ),
                                TextSpan(
                                    text: '\n10',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 90)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 80.0,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          CustomButton(
                            onTap: () {
                              showRevealBottom(context);
                              //SHOW THIS TILL THE USER CLICKS ON  THE SHARE BUTTON, AFTER THAT JUST DIRECTLY SEND TO SNAP STORY
                            },
                            text: 'Answer',
                            image: Image.asset('assets/images/snap.png'),
                            buttonColor: HexColor('FFE500'),
                            textColor: Colors.white,
                            // text: 'Answer',
                            // image: Image.asset('assets/images/instagram.png'),
                            // buttonColor: HexColor('F24139'),
                            // textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          CustomButton(
                            onTap: () {
                              //FIRST SHOW FREE REVEAL SHEET TILL THE USER CLICKS ON  THE SHARE BUTTON, AFTER THAT GIVE unlimited REVEALS WITHOUT ADS for a day
                              context.goNamed(RevealedScreen.routeName);
                            },
                            text: 'Reveal Sender',
                            buttonColor: Colors.white,
                            textColor: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ArrowBar(
                title: '',
                backgroundColor: Colors.transparent,
                onBack: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
