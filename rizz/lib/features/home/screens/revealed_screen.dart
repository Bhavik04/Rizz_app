import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/db/modals/user.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/dm_bottom.dart';

class RevealedScreen extends StatefulWidget {
  static const routeName = 'RevealedScreen';

  final AppUser user;
  final String rating;

  const RevealedScreen({Key? key, required this.user, required this.rating})
      : super(key: key);

  @override
  State<RevealedScreen> createState() => _RevealedScreenState();
}

class _RevealedScreenState extends State<RevealedScreen> {
  @override
  Widget build(BuildContext context) {
    final userImages = jsonDecode(widget.user.imageUrls);

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
                      child: Image.network(
                        userImages[0],
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
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${widget.user.name}, ${widget.user.age}',
                                    style: const TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '\nNew Delhi, Rating: ${widget.rating}',
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
