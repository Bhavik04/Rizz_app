import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_divider.dart';
import 'package:rizz/features/auth/widgets/custom_popup.dart';

void showSnapchatBottom(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return _buildSnapchatBottomSheet(context);
    },
  );
}

Widget _buildSnapchatBottomSheet(BuildContext context) {
  return SingleChildScrollView(
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: HexColor('fefefe'),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
              child: Text(
                'Reveal Snapchat Username',
                style: TextStyle(
                    color: HexColor('FF8A00'),
                    fontSize: 24,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.02),
              width: GlobalVariables.deviceWidth * 0.70,
              child: const Text(
                '3 daily reveals left',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.02),
              child: CustomButton(
                onTap: () {},
                text: 'Reveal',
                buttonColor: Colors.black,
                textColor: HexColor('FFFFFF'),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomDividerRow()),
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.02),
              child: CustomButton(
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
                text: 'God Mode',
                buttonColor: HexColor('F24139'),
                textColor: HexColor('FFFFFF'),
                image: Image.asset('assets/images/thunder.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
              width: GlobalVariables.deviceWidth * 0.70,
              child: const Text(
                'Get weekly unlimited snapchat reveals',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ),
  );
}
