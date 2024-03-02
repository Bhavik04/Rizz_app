import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_divider.dart';

void showRevealBottom(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return _buildRevealBottomSheet(context);
    },
  );
}

Widget _buildRevealBottomSheet(BuildContext context) {
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
                'Unlimited Reveals',
                style: TextStyle(
                    color: HexColor('FF8A00'),
                    fontSize: 24,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.02),
              width: GlobalVariables.deviceWidth * 0.75,
              child: const Text(
                'Share the best rating on your snap story and get unlimited reveals for a day',
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
                  //SHARE RATING TO SNAP STORY
                },
                text: 'Share',
                image: Image.asset('assets/images/snap.png'),
                buttonColor: HexColor('FFE500'),
                textColor: Colors.white,
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomDividerRow()),
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.02),
              child: CustomButton(
                onTap: () {
                  // SHOW ONE AD
                },
                text: 'Watch AD',
                buttonColor: HexColor('F24139'),
                textColor: HexColor('FFFFFF'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
              width: GlobalVariables.deviceWidth * 0.70,
              child: const Text(
                'Watch one ad for each reveal',
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
