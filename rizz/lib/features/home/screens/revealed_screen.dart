import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_backarrow.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';

class RevealedScreen extends StatefulWidget {
  static const routeName = 'RevealedScreen';

  const RevealedScreen({super.key});

  @override
  State<RevealedScreen> createState() => _RevealedScreenState();
}

class _RevealedScreenState extends State<RevealedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('141414'),
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 10.0),
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
                    Positioned(
                      bottom: 80.0,
                      left: 0,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: GlobalVariables.deviceWidth * 0.10),
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Ankush',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\n19, New Delhi',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                            onTap: () {},
                            text: 'Reveal Snapchat 0/3',
                            buttonColor: HexColor('FFE500'),
                            textColor: Colors.white,
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
              child: ArrowAppBar(
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
