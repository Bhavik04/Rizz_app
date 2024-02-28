import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/dm_bottom.dart';

class RevealedScreen extends StatefulWidget {
  static const routeName = 'RevealedScreen';

  const RevealedScreen({Key? key}) : super(key: key);

  @override
  State<RevealedScreen> createState() => _RevealedScreenState();
}

class _RevealedScreenState extends State<RevealedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
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
                            onTap: () {
                              showMessageBottom(context);
                            },
                            text: 'DM User',
                            buttonColor: Colors.black,
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
              child: ArrowBar(
                title: '',
                backgroundColor: Colors.transparent,
                onBack: () {
                  Navigator.pop(context);
                },
                showReportButton: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
