import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/home/screens/play.dart';

class OnboardScreen extends StatefulWidget {
  static const routeName = 'OnboardScreen';
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class OnboardPage extends StatelessWidget {
  final String mainText;
  final String smallText;
  final String imagePath;
  final VoidCallback onNext;
  final bool isLastPage;

  const OnboardPage({
    Key? key,
    required this.mainText,
    required this.smallText,
    required this.imagePath,
    required this.onNext,
    this.isLastPage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.20),
          child: CustomText(text: mainText),
        ),
        Container(
          margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
          width: GlobalVariables.deviceWidth * 0.70,
          alignment: Alignment.center,
          child: Text(
            smallText,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
          color: Colors.black,
          child: Image.asset(
            imagePath,
            height: 80,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.25),
          child: CustomButton(
            text: isLastPage ? 'Go Slay' : 'Next',
            onTap: onNext,
            buttonColor: GlobalVariables.themeColor,
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _OnboardScreenState extends State<OnboardScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  Widget _buildPageIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      indicators.add(Container(
        width: 8.0,
        height: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == i ? GlobalVariables.themeColor : Colors.white,
        ),
      ));
    }

    return Container(
      margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: indicators,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            _buildPageIndicator(),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: [
                  OnboardPage(
                    mainText: "Get tons of ratings!",
                    smallText:
                        'Get some good validation and \nboost your confidence',
                    imagePath: 'assets/images/rating.png',
                    onNext: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                  ),
                  OnboardPage(
                    mainText: "See who likes you",
                    smallText:
                        'Reveal who rated you and share your response on your socials',
                    imagePath: 'assets/images/reveal1.png',
                    onNext: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                  ),
                  OnboardPage(
                    mainText: "Get Snapchat of people you like",
                    smallText:
                        'Make new snapchat friends to talk, make streaks and much more',
                    imagePath: 'assets/images/reveal2.png',
                    onNext: () {
                      context.goNamed(PlayScreen.routeName);
                    },
                    isLastPage: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
