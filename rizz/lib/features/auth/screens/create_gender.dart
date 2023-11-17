import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/screens/create_age.dart';
import 'package:rizz/features/auth/screens/create_state.dart';
import 'package:rizz/features/auth/widgets/custom_backarrow.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/auth/widgets/custom_text2.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';

class GenderScreen extends StatefulWidget {
  static const routeName = 'GenderScreen';

  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.themeColor,
        appBar: ArrowAppBar(
          onBack: () {
            context.goNamed(AgeScreen.routeName);
          },
          title: '',
        ),
        body: SingleChildScrollView(
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
              InkWell(
                onTap: () {
                  setState(() {
                    selectedGender = 'Boy';
                  });
                  debugPrint('button Tapped: Boy');
                },
                child: genderContainer('Boy', 'assets/images/boy.png'),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedGender = 'Girl';
                  });
                  debugPrint('button Tapped: Girl');
                },
                child: genderContainer('Girl', 'assets/images/girl.png'),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedGender = 'Other';
                  });
                  debugPrint('button Tapped: Other');
                },
                child: genderContainer('Other', null),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: GlobalVariables.deviceHeight * 0.02,
                ),
                width: GlobalVariables.deviceWidth * 0.55,
                child: const CustomSmallText(
                  text: 'This info cannot be changed later',
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: GlobalVariables.deviceHeight * 0.04,
                ),
                child: CustomButton(
                  text: 'Next',
                  onTap: () async {
                    // Call the FirestoreService to update user data with the selected gender
                    await _firestoreService.createUserData(
                      _authService.currentUser?.uid ?? '',
                      null, // Do not update username
                      null, // Do not update snapchat
                      0, // Do not update age
                      gender: selectedGender,
                    );

                    // Navigate to the next screen
                    context.goNamed(StateScreen.routeName);
                  },
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget genderContainer(String text, String? imagePath) {
    return Container(
      margin: EdgeInsets.only(
        top: GlobalVariables.deviceHeight * 0.01,
      ),
      width: GlobalVariables.deviceWidth * 0.75,
      height: 60,
      decoration: BoxDecoration(
        color: selectedGender == text ? Colors.black : Colors.white38,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          if (imagePath != null) ...[
            const SizedBox(width: 10),
            Image.asset(
              imagePath,
              height: 30,
              width: 30,
            ),
          ],
        ],
      ),
    );
  }
}
