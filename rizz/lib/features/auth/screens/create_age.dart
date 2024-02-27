// AgeScreen
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/screens/create_gender.dart';
import 'package:rizz/features/auth/screens/create_referral.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';

class AgeScreen extends StatefulWidget {
  static const routeName = 'AgeScreen';

  const AgeScreen({Key? key}) : super(key: key);

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  final TextEditingController _ageController = TextEditingController();
  bool _isAgeValid = false; // New variable to track validity

  @override
  void initState() {
    super.initState();

    // Add listener to update _isAgeValid when the text changes
    _ageController.addListener(() {
      setState(() {
        _isAgeValid = _ageController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _ageController.dispose();
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
            context.goNamed(ReferralScreen.routeName);
          },
          showReportButton: false,
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
              horizontal: GlobalVariables.deviceWidth * 0.1,
            ),
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.05),
                  width: GlobalVariables.deviceWidth * 0.50,
                  child: const CustomText(
                    text: "How old are you?",
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                  width: GlobalVariables.deviceWidth * 0.75,
                  height: 60,
                  child: TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(2)],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    maxLength: 10,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    cursorColor: Colors.white,
                    showCursor: true,
                    autofocus: true,
                    decoration: InputDecoration(
                      counterText: "",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.white.withOpacity(0.1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
                  width: GlobalVariables.deviceWidth * 0.55,
                  child: const CustomText(
                    text: 'This info cannot be changed later',
                    textColor: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                  child: CustomButton(
                    text: 'Next',
                    onTap: () async {
                      if (_isAgeValid) {
                        final enteredAge =
                            int.tryParse(_ageController.text) ?? 0;

                        if (enteredAge >= 13) {
                          // await _firestoreService.createUserData(
                          //   _authService.currentUser?.uid ?? '',
                          //   null,
                          //   '',
                          //   enteredAge,
                          // );
                          GlobalVariables.age = enteredAge;

                          context.goNamed(GenderScreen.routeName);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Age must be at least 13',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      }
                    },
                    buttonColor: _isAgeValid ? Colors.white : Colors.white70,
                    textColor: _isAgeValid ? Colors.black : Colors.white,
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
