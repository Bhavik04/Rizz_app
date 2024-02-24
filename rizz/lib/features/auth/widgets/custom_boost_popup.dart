import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_popup.dart';

class CustomBoostPopup extends StatefulWidget {
  final VoidCallback onButtonTap;

  const CustomBoostPopup({
    Key? key,
    required this.onButtonTap,
  }) : super(key: key);

  @override
  State<CustomBoostPopup> createState() => _CustomBoostPopupState();
}

class _CustomBoostPopupState extends State<CustomBoostPopup> {
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
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
                width: GlobalVariables.deviceWidth * 0.70,
                child: Text(
                  'Boost',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: HexColor('FD630F')),
                )),
            SizedBox(
              width: GlobalVariables.deviceWidth * 0.70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Be the #1 profile',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: HexColor('FFFFFF')),
                  ),
                  const SizedBox(width: 5),
                  Image.asset('assets/images/hot.png')
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.08),
              alignment: Alignment.center,
              child: Image.asset('assets/images/boost.png'),
            ),
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
              width: GlobalVariables.deviceWidth * 0.70,
              child: Text(
                'Get super boosts & 10x messages',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: HexColor('FFFFFF')),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
              child: CustomButton(
                  text: 'Boost',
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          onButtonTap: (buttonText) {
                            debugPrint('$buttonText button tapped');
                          },
                        );
                      },
                    );
                  },
                  buttonColor: HexColor('F24139'),
                  textColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
