import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/home/screens/subscription.dart';

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
        color: HexColor('141414'),
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
              child: const Text(
                'Reveal Snapchat Username',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
              width: GlobalVariables.deviceWidth * 0.70,
              child: const Text(
                'Premium users can reveal snapchat username of all profiles',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
              child: CustomButton(
                onTap: () {
                  Navigator.pop(context);
                  context.goNamed(SubscriptionScreen.routeName);
                },
                text: 'See Username',
                buttonColor: HexColor('FFD500'),
                textColor: HexColor('FFFFFF'),
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
