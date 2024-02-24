import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';

class BlurredScreen extends StatefulWidget {
  static const routeName = 'BlurredScreen';

  const BlurredScreen({super.key});

  @override
  State<BlurredScreen> createState() => _BlurredScreenState();
}

class _BlurredScreenState extends State<BlurredScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('0f0f0f'),
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
                      child: Image.asset(
                        'assets/images/eww.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
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
                          const Text(
                            'A 21 year old girl from New Delhi',
                            style: TextStyle(
                              fontSize: 16.0,
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
                                    fontSize: 25.0,
                                  ),
                                ),
                                TextSpan(
                                    text: '\n10',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 80)),
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
                            onTap: () {},
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
                              context.goNamed('RevealedScreen');
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
                showReportButton: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
