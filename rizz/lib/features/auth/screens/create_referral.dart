import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/screens/create_age.dart';
import 'package:rizz/features/auth/screens/create_snapchat.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/auth/widgets/custom_textfield.dart';

class ReferralScreen extends StatefulWidget {
  static const routeName = 'ReferralScreen';

  const ReferralScreen({super.key});

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  final _referController = TextEditingController();
  bool _isReferValid = false; // New variable to track validity

  @override
  void initState() {
    super.initState();

    // Add listener to update _isReferValid when the text changes
    _referController.addListener(() {
      setState(() {
        _isReferValid = _referController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // _referController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('FF5C67'),
        appBar: ArrowBar(
          title: '',
          backgroundColor: HexColor('F33C5E'),
          onBack: () {
            context.goNamed(SnapchatScreen.routeName);
          },
        ),
        body: Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              stops: const [0.3, 0.5, 0.9],
              colors: [
                HexColor('F33C5E'),
                HexColor('F85D3E'),
                HexColor('FF8A41'),
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: GlobalVariables.deviceWidth * 0.1),
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.07),
                  width: GlobalVariables.deviceWidth * 0.72,
                  child: const CustomText(text: "Any Referral Code?"),
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: GlobalVariables.deviceHeight * 0.04),
                    width: GlobalVariables.deviceWidth * 0.75,
                    height: 60,
                    child: CustomTextField(
                        controller: _referController, saveKey: 'refer')),
                Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                  child: CustomButton(
                    text: 'Next',
                    onTap: () {
                      if (_isReferValid) {
                        debugPrint('print button');
                        context.goNamed(AgeScreen.routeName);
                      }
                    },
                    buttonColor: _isReferValid ? Colors.white : Colors.white70,
                    textColor: _isReferValid ? Colors.black : Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('button Tapped');
                    context.goNamed(AgeScreen.routeName);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: GlobalVariables.deviceHeight * 0.02),
                    width: GlobalVariables.deviceWidth * 0.55,
                    child: const Text(
                      'Skip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
