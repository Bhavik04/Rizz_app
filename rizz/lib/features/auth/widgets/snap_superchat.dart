import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';

class CustomButtonsColumn extends StatelessWidget {
  final VoidCallback onSnapchatTap;
  final VoidCallback onSuperChatTap;

  const CustomButtonsColumn({super.key, 
    required this.onSnapchatTap,
    required this.onSuperChatTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: onSnapchatTap,
              child: Padding(
                padding: EdgeInsets.only(
                  right: GlobalVariables.deviceWidth * 0.02,
                ),
                child: Container(
                  height: GlobalVariables.deviceHeight * 0.055,
                  width: GlobalVariables.deviceWidth * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.yellow,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/snap.png'),
                      const SizedBox(
                        width: 2,
                      ),
                      // Include the commented part below if needed
                      // const CustomText(
                      //   text: '@sobuhikehde',
                      //   fontSize: 12,
                      //   fontWeight: FontWeight.normal,
                      //   textColor: Colors.black,
                      // )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: onSuperChatTap,
              child: Padding(
                padding: EdgeInsets.only(
                  right: GlobalVariables.deviceWidth * 0.04,
                ),
                child: Image.asset(
                  'assets/images/superchat.png',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
