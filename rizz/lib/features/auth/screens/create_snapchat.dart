import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/screens/create_referral.dart';
import 'package:rizz/features/auth/screens/create_username.dart';
import 'package:rizz/features/auth/widgets/custom_backarrow.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/auth/widgets/custom_text2.dart';

class SnapchatScreen extends StatefulWidget {
  static const routeName = 'SnapchatScreen';

  const SnapchatScreen({super.key});

  @override
  State<SnapchatScreen> createState() => _SnapchatScreenState();
}

class _SnapchatScreenState extends State<SnapchatScreen> {
  final _snapchatController = TextEditingController();

  @override
  void dispose() {
    _snapchatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.themeColor,
        appBar: ArrowAppBar(
          onBack: () {
            context.goNamed(UserNameScreen.routeName);
          },
          title: '',
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: GlobalVariables.deviceWidth * 0.1),
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                width: GlobalVariables.deviceWidth * 0.72,
                child: const CustomText(text: "What's your Snapchat username?"),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                width: GlobalVariables.deviceWidth * 0.75,
                height: 60,
                child: TextField(
                  controller: _snapchatController,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  maxLength: 10,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  cursorColor: Colors.black12,
                  decoration: InputDecoration(
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.white.withOpacity(0.5),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
                width: GlobalVariables.deviceWidth * 0.55,
                child: const CustomSmallText(
                    text: 'This info cannot be changed later'),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.04),
                child: CustomButton(
                  text: 'Next',
                  onTap: () {
                    debugPrint('print button');
                    context.goNamed(ReferralScreen.routeName);
                  },
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
