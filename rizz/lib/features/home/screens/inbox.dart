import 'package:flutter/material.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/new_card_widget.dart';
import 'package:rizz/features/auth/widgets/custom_appbar.dart';
import 'package:rizz/features/auth/widgets/revealed_card_widget.dart';

class InboxScreen extends StatefulWidget {
  static const routeName = 'InboxScreen';

  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor("0F0F0F"),
          appBar: const CustomAppBar(),
          body: Column(
            children: [
              const TabBar(
                labelColor: Colors.white,
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(text: 'New'),
                  Tab(text: 'Reveal'),
                ],
                indicatorColor: Colors.white,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    //new tab
                    NewCardWidget(),
                    //reveal tab
                    RevealedCardWidget()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
