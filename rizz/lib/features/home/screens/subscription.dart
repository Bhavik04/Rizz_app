// subscription_screen.dart

import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/sub_bottomsheet.dart';

class SubscriptionScreen extends StatefulWidget {
  static const routeName = 'SubscriptionScreen';

  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int currentPage = 0;
  late PageController pageController;

  List<String> imageList = [
    'assets/images/sub_boost.png',
    'assets/images/sub_superchat.png',
    'assets/images/sub_reveal.png',
    'assets/images/sub_chat.png',
    'assets/images/sub_snap.png',
    'assets/images/sub_swipe.png',
    'assets/images/sub_ads.png',
    'assets/images/sub_access.png',
  ];

  List<String> imageTexts = [
    '5 weekly Boosts',
    'Unlimited Super Chats',
    'Unlimited Reveals',
    "Unlimited DM's on reveals",
    'Unlimited Snapchat username reveals',
    'Unlimited Swipes',
    'See no-ads',
    'Early access to new & upcoming features',
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: ArrowBar(
          title: '',
          backgroundColor: Colors.transparent,
          onBack: () {
            Navigator.pop(context);
          },
          showCrossIcon: true,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.00),
                alignment: Alignment.center,
                width: GlobalVariables.deviceWidth * 0.70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'God Mode',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Image.asset('assets/images/thunder.png'),
                  ],
                ),
              ),
              Container(
                height: 210,
                width: 350,
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
                child: PageView.builder(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: imageList.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: GlobalVariables.deviceHeight * 0.2,
                            child: Center(
                              child: Image.asset(imageList[index]),
                            ),
                          ),
                          SizedBox(
                            width: GlobalVariables.deviceWidth * 0.5,
                            child: Text(
                              imageTexts[index],
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  imageList.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == currentPage
                          ? HexColor('F24139')
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: const SubscriptionBottomSheet(),
      ),
    );
  }
}