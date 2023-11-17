// AgeScreen
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/screens/create_gender.dart';
import 'package:rizz/features/auth/screens/create_referral.dart';
import 'package:rizz/features/auth/widgets/custom_backarrow.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/auth/widgets/custom_text2.dart';
import 'package:rizz/services/auth_service.dart'; // Import your AuthService
import 'package:rizz/services/firestore_service.dart'; // Import your FirestoreService
import 'package:go_router/go_router.dart';

class AgeScreen extends StatefulWidget {
  static const routeName = 'AgeScreen';

  const AgeScreen({Key? key}) : super(key: key);

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  final TextEditingController _ageController = TextEditingController();
  final AuthService _authService =
      AuthService(); // Create an instance of your AuthService
  final FirestoreService _firestoreService =
      FirestoreService(); // Create an instance of your FirestoreService

  @override
  void dispose() {
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.themeColor,
        appBar: ArrowAppBar(
          onBack: () {
            context.goNamed(ReferralScreen.routeName);
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
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
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
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  maxLength: 10,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  cursorColor: Colors.black12,
                  decoration: InputDecoration(
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.white.withOpacity(0.5),
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
                child: const CustomSmallText(
                  text: 'This info cannot be changed later',
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.04),
                child: CustomButton(
                  text: 'Next',
                  onTap: () async {
                    final enteredAge = int.tryParse(_ageController.text) ?? 0;

                    if (enteredAge >= 18) {
                      // Call the FirestoreService to update user data
                      await _firestoreService.createUserData(
                        _authService.currentUser?.uid ??
                            '', // Use the dynamic user ID or an empty string
                        null, // Do not update username
                        '', // Do not update snapchat
                        enteredAge, // Pass the entered age to the FirestoreService if greater than or equal to 18
                      );

                      // Navigate to the next screen
                      context.goNamed(GenderScreen.routeName);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Age must be at least 18',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
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
}
