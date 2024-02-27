import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';

class Powers extends StatelessWidget {
  const Powers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.02),
      height: GlobalVariables.deviceHeight * 0.5,
      width: GlobalVariables.deviceWidth * 0.9,
      decoration: BoxDecoration(
        color: HexColor('141414'),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.redAccent,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _buildTitleRow(),
            const SizedBox(height: 5.0),
            _buildSubtitleText(),
            const SizedBox(height: 30.0),
            _buildPowerRow(
              'assets/images/freeboost.png',
              'Unlock free mini boost',
            ),
            const SizedBox(height: 5.0),
            _buildPowerRow(
              'assets/images/directheart.png',
              '5 Direct messages, chat instantly without rating',
            ),
            const SizedBox(height: 5.0),
            _buildPowerRow(
              'assets/images/chat.png',
              '5 messages on reveals instead of 3 for a week',
            ),
            const SizedBox(height: 30),
            _buildInviteButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomText(
          text: 'Free Super Powers',
          textColor: Colors.redAccent,
          fontSize: 30,
        ),
        Image.asset(
          'assets/images/thunder.png',
          width: 30.0,
          height: 30.0,
        ),
      ],
    );
  }

  Widget _buildSubtitleText() {
    return const CustomText(
      text: 'Unlock one superpower for each invite',
      textColor: Colors.white70,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _buildPowerRow(String imagePath, String powerText) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 30.0,
          height: 30.0,
        ),
        const SizedBox(width: 10.0),
        Container(
          width: GlobalVariables.deviceWidth * 0.65,
          alignment: Alignment.centerLeft,
          child: CustomText(
            text: powerText,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            alignment: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget _buildInviteButton() {
    return CustomButton(
      text: 'Invite Friends 0/3',
      onTap: () {
        debugPrint('Print button tapped');
      },
      buttonColor: HexColor('F24139'),
      textColor: Colors.white,
    );
  }
}
