import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_popup.dart';

void showSuperChat(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return _buildSuperChat(context);
    },
  );
}

Widget _buildSuperChat(BuildContext context) {
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
                'Unlimited Super Chats',
                style: TextStyle(
                    color: HexColor('FF8A00'),
                    fontSize: 24,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.02),
              width: GlobalVariables.deviceWidth * 0.60,
              child: const Text(
                'Premium users can chat instantly without rating anyone',
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
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    ),
  );
}
