// GenderScreen
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/screens/access.dart';
import 'package:rizz/features/auth/screens/create_age.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/auth/widgets/user_gender.dart';

class GenderScreen extends StatefulWidget {
  static const routeName = 'GenderScreen';

  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? usergender;
  bool _isGenderSelected = false; // New variable to track selection

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('FF5C67'),
        appBar: ArrowBar(
          title: '',
          backgroundColor: HexColor('F33C5E'),
          onBack: () {
            context.goNamed(AgeScreen.routeName);
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
              horizontal: GlobalVariables.deviceWidth * 0.1,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: GlobalVariables.deviceHeight * 0.03,
                  ),
                  width: GlobalVariables.deviceWidth * 0.55,
                  child: const CustomText(
                    text: "What gender do you identify as?",
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                GenderContainer(
                  text: 'Boy',
                  imagePath: 'assets/images/boy.png',
                  containerWidth: 300,
                  containerHeight: 60,
                  backgroundColor: Colors.black,
                  isSelected: usergender == 'Boy',
                  onTap: () {
                    setState(() {
                      usergender = 'Boy';
                      _isGenderSelected = true; // Update the selection status
                    });
                    debugPrint('button Tapped: Boy');
                  },
                ),
                GenderContainer(
                  text: 'Girl',
                  imagePath: 'assets/images/girl.png',
                  containerWidth: 300,
                  containerHeight: 60,
                  backgroundColor: Colors.black,
                  isSelected: usergender == 'Girl',
                  onTap: () {
                    setState(() {
                      usergender = 'Girl';
                      _isGenderSelected = true; // Update the selection status
                    });
                    debugPrint('button Tapped: Girl');
                  },
                ),
                GenderContainer(
                  text: 'Other',
                  containerWidth: 300,
                  containerHeight: 60,
                  backgroundColor: Colors.black,
                  isSelected: usergender == 'Other',
                  onTap: () {
                    setState(() {
                      usergender = 'Other';
                      _isGenderSelected = true; // Update the selection status
                    });
                    debugPrint('button Tapped: Other');
                  },
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: GlobalVariables.deviceHeight * 0.02,
                  ),
                  width: GlobalVariables.deviceWidth * 0.55,
                  child: const CustomText(
                    text: 'This info cannot be changed later',
                    textColor: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: GlobalVariables.deviceHeight * 0.03,
                  ),
                  child: CustomButton(
                    text: 'Next',
                    onTap: () async {
                      if (_isGenderSelected) {
                        // await _firestoreService.createUserData(
                        //   _authService.currentUser?.uid ?? '',
                        //   null,
                        //   null,
                        //   0,
                        //   gender: usergender,
                        // );
                        GlobalVariables.gender = usergender;
                        context.goNamed(AcessScreen.routeName);
                      }
                    },
                    buttonColor: _isGenderSelected
                        ? Colors.white
                        : Colors
                            .white70, // Adjust button color based on selection
                    textColor: _isGenderSelected ? Colors.black : Colors.white,
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
