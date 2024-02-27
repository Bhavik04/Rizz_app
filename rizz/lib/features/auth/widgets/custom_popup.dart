import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';

class CustomDialog extends StatefulWidget {
  final Function(String) onButtonTap;

  const CustomDialog({
    Key? key,
    required this.onButtonTap,
  }) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  int currentPage = 0;
  late PageController pageController;

  List<String> imageList = [
    'assets/images/sub_boost.png',
    'assets/images/sub_reveal.png',
    'assets/images/sub_chat.png',
    'assets/images/sub_snap.png',
    'assets/images/sub_swipe.png',
    'assets/images/sub_ads.png',
    'assets/images/sub_access.png',
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
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
              width: GlobalVariables.deviceWidth * 0.70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'God Mode',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: HexColor('FFFFFF')),
                  ),
                  const SizedBox(width: 5),
                  Image.asset('assets/images/thunder.png')
                ],
              ),
            ),
            Container(
              height: 110,
              width: 250,
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
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
                    child: Center(
                      child: Image.asset(imageList[index]),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: GlobalVariables.deviceHeight * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  imageList.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == currentPage
                          ? HexColor('F9551F')
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: GlobalVariables.deviceHeight * 0.04,
              ),
              child: CustomButton(
                text: 'Slay God',
                onTap: () {},
                buttonColor: HexColor('F24139'),
                textColor: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: GlobalVariables.deviceHeight * 0.01,
              ),
              width: GlobalVariables.deviceWidth * 0.70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Terms',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: HexColor('D0D0D0'),
                        decoration: TextDecoration.underline,
                        decorationColor: HexColor('D0D0D0'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: GlobalVariables.deviceHeight * 0.02,
              ),
              child: CustomButton(
                text: 'Slay God +',
                onTap: () {},
                buttonColor: Colors.black,
                textColor: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: GlobalVariables.deviceHeight * 0.01,
              ),
              width: GlobalVariables.deviceWidth * 0.70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Terms',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: HexColor('D0D0D0'),
                        decoration: TextDecoration.underline,
                        decorationColor: HexColor('D0D0D0'),
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
  }
}
