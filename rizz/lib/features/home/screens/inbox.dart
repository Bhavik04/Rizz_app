import 'package:flutter/material.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_appbar.dart';

class InboxScreen extends StatefulWidget {
  static const routeName = 'InboxScreen';

  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  void showCustomBottomSheet(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: HexColor("141414"),
          appBar: CustomAppBar(
            onLeftIconTap: () {},
            onRightIconTap: () {},
          ),
          body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [],
            ),
          )),
    );
  }
}
