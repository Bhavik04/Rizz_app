import 'package:flutter/material.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_appbar.dart';

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
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor("0F0F0F"),
      appBar: CustomAppBar(
        onLeftIconTap: () {},
        onRightIconTap: () {
          showCustomBottomSheet(context);
        },
      ),
    ));
  }
}
