import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/home/screens/play.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = 'ProfileScreen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> imageList = [
    'assets/images/sub_boost.png',
    'assets/images/sub_swipe.png',
    'assets/images/sub_reveal.png',
    'assets/images/sub_chat.png',
    'assets/images/sub_snap.png',
    'assets/images/sub_ads.png',
    'assets/images/sub_access.png',
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('141414'),
        appBar: AppBar(
          backgroundColor: HexColor('141414'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: HexColor('FFFFFF'),
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.10),
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        PageController pageController = PageController(
                          initialPage: 0,
                          viewportFraction: 0.8,
                        );
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: HexColor('2C2C3C'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                  color: HexColor('F9551F'),
                                  width: 4.0,
                                ),
                              ),
                              content: Container(
                                alignment: Alignment.center,
                                height: GlobalVariables.deviceHeight * 0.560,
                                width: 260.0,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: GlobalVariables.deviceHeight *
                                              0.01),
                                      width: GlobalVariables.deviceWidth * 0.70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'God Mode',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w900,
                                                color: HexColor('FFFFFF')),
                                          ),
                                          const SizedBox(width: 5),
                                          Image.asset(
                                              'assets/images/thunder.png')
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 110,
                                      width: 250,
                                      margin: EdgeInsets.only(
                                          top: GlobalVariables.deviceHeight *
                                              0.03),
                                      child: PageView.builder(
                                        controller: pageController,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: imageList.length,
                                        onPageChanged: (index) {
                                          setState(() {
                                            currentPage = index;
                                          });
                                        },
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child:
                                                  Image.asset(imageList[index]),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: GlobalVariables.deviceHeight *
                                              0.01),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                          imageList.length,
                                          (index) => Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            width: 8.0,
                                            height: 8.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: index == currentPage
                                                  ? Colors.white
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top:
                                            GlobalVariables.deviceHeight * 0.04,
                                      ),
                                      child: CustomButton(
                                        text: 'Rizz God',
                                        onTap: () {
                                          debugPrint('Print button tapped');
                                          // context.goNamed(ChatScreen.routeName);
                                        },
                                        buttonColor: HexColor('F24139'),
                                        textColor: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top:
                                            GlobalVariables.deviceHeight * 0.01,
                                      ),
                                      width: GlobalVariables.deviceWidth * 0.70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Become Pro member for ₹79/week.',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900,
                                              color: HexColor('D0D0D0'),
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          InkWell(
                                            onTap: () {},
                                            child: Text(
                                              'Terms',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w900,
                                                color: HexColor('D0D0D0'),
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    HexColor('D0D0D0'),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top:
                                            GlobalVariables.deviceHeight * 0.02,
                                      ),
                                      child: CustomButton(
                                        text: 'Rizz God +',
                                        onTap: () {
                                          debugPrint('Print button tapped');
                                          // context.goNamed(ChatScreen.routeName);
                                        },
                                        buttonColor: Colors.black,
                                        textColor: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top:
                                            GlobalVariables.deviceHeight * 0.01,
                                      ),
                                      width: GlobalVariables.deviceWidth * 0.70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Become Pro member for ₹149/month.',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900,
                                              color: HexColor('D0D0D0'),
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          InkWell(
                                            onTap: () {},
                                            child: Text(
                                              'Terms',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w900,
                                                color: HexColor('D0D0D0'),
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    HexColor('D0D0D0'),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/images/subscription.png',
                    fit: BoxFit.contain,
                    height: GlobalVariables.deviceHeight * 0.19,
                    width: GlobalVariables.deviceWidth * 0.90,
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                child: CustomButton(
                  text: 'Send Feedback',
                  onTap: () {
                    debugPrint('Print button tapped');
                    context.goNamed(PlayScreen.routeName);
                  },
                  buttonColor: HexColor('693DE7'),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
