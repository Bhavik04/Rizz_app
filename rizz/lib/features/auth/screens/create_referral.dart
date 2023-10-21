import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/features/auth/screens/create_age.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/auth/widgets/custom_textfield.dart';

class ReferralScreen extends StatefulWidget {
  static const routeName = 'ReferralScreen';

  const ReferralScreen({super.key});

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: GlobalVariables.themeColor,
            body: Container(
                alignment: Alignment.center,
                child: Column(children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: GlobalVariables.deviceHeight * 0.12),
                      width: GlobalVariables.deviceWidth * 0.72,
                      child: const CustomText(text: "Any Referral Code?")),
                  Container(
                    margin: EdgeInsets.only(
                        top: GlobalVariables.deviceHeight * 0.04),
                    width: GlobalVariables.deviceWidth * 0.75,
                    height: 60,
                    child: const CustomTextField(),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: GlobalVariables.deviceHeight * 0.04),
                    child: CustomButton(
                        text: 'Next',
                        onTap: () {
                          debugPrint('print button');
                          context.goNamed(AgeScreen.routeName);
                        }),
                  ),
                  InkWell(
                    onTap: () {
                      debugPrint('button Tapped');
                      context.goNamed(AgeScreen.routeName);
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            top: GlobalVariables.deviceHeight * 0.02),
                        width: GlobalVariables.deviceWidth * 0.55,
                        child: const Text(
                          'Skip',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  ),
                ]))));
  }
}
