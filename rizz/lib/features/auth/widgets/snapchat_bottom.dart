import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';

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
        color: HexColor('282828'),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.02),
              child: const Text(
                'Reveal Snapchat Username',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.02),
              width: GlobalVariables.deviceWidth * 0.70,
              child: Text(
                'Rizz God users can reveal snapchat username of all profiles',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    color: HexColor('C0C0C0'),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
              child: CustomButton(
                  onTap: () {},
                  text: 'See Username',
                  buttonColor: HexColor('FFEB3B'),
                  textColor: HexColor('FFFFFF')),
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
