// SnapchatScreen
import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/screens/create_referral.dart';
import 'package:rizz/features/auth/screens/create_username.dart';
import 'package:rizz/features/auth/widgets/custom_backarrow.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/features/auth/widgets/custom_text2.dart';
import 'package:rizz/features/auth/widgets/custom_textfield.dart';
import 'package:rizz/services/auth_service.dart'; // Import your AuthService
import 'package:rizz/services/firestore_service.dart'; // Import your FirestoreService

class SnapchatScreen extends StatefulWidget {
  static const routeName = 'SnapchatScreen';

  const SnapchatScreen({Key? key}) : super(key: key);

  @override
  State<SnapchatScreen> createState() => _SnapchatScreenState();
}

class _SnapchatScreenState extends State<SnapchatScreen> {
  final _snapchatController = TextEditingController();
  final AuthService _authService =
      AuthService(); // Create an instance of your AuthService
  final FirestoreService _firestoreService =
      FirestoreService(); // Create an instance of your FirestoreService

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.themeColor,
        appBar: ArrowAppBar(
          onBack: () {
            context.goNamed(UserNameScreen.routeName);
          },
          title: '',
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: GlobalVariables.deviceWidth * 0.1),
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                width: GlobalVariables.deviceWidth * 0.72,
                child: const CustomText(text: "What's your Snapchat username?"),
              ),
              Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                  width: GlobalVariables.deviceWidth * 0.75,
                  height: 60,
                  child: CustomTextField(
                      controller: _snapchatController, saveKey: 'snapchat')),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
                width: GlobalVariables.deviceWidth * 0.55,
                child: const CustomSmallText(
                    text: 'This info cannot be changed later'),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.04),
                child: CustomButton(
                  text: 'Next',
                  onTap: () async {
                    // Call the FirestoreService to update user data
                    await _firestoreService.createUserData(
                      _authService.currentUser?.uid ?? '',
                      null, // Do not update username
                      _snapchatController.text.isNotEmpty
                          ? _snapchatController.text
                          : null, // Pass the entered snapchat to the FirestoreService if not empty
                      0, // Do not update age
                    );

                    debugPrint('print button');
                    context.goNamed(ReferralScreen.routeName);
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
