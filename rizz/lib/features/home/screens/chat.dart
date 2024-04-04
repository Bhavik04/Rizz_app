import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/widgets/custom_appbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/home/screens/play.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = 'ChatScreen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void showCustomBottomSheet(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: GlobalVariables.deviceHeight * 0.02,
                left: GlobalVariables.deviceWidth * 0.05),
            child: const CustomText(
              text: 'Messages',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              textColor: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.2),
            child: const CustomText(
              text: 'Oops! looks like you got no messages yet',
              alignment: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.05),
            alignment: Alignment.center,
            child: CustomButton(
              onTap: () {
                context.goNamed(PlayScreen.routeName);
              },
              text: 'Start rating',
              buttonColor: GlobalVariables.themeColor,
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
