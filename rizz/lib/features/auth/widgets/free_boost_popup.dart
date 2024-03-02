import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';

class FreeBoostPopup extends StatelessWidget {
  const FreeBoostPopup({super.key});

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
              child: Text(
                'Free Boost',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: HexColor('FD630F')),
              ),
            ),
            SizedBox(
              width: GlobalVariables.deviceWidth * 0.70,
              child: Text(
                'Get one free boost for each invite',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: HexColor('FFFFFF')),
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
                'Get free boosts upto 3 invites',
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
                  text: 'Invite friend',
                  onTap: () {
                    debugPrint('Print button tapped');
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
