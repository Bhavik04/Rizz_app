import 'package:flutter/material.dart';
import 'package:rizz/features/auth/screens/create_snapchat.dart';
import 'package:rizz/features/auth/widgets/custom_backarrow.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/widgets/custom_text2.dart';
import 'package:rizz/features/auth/widgets/custom_textfield.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';
import 'package:go_router/go_router.dart';

class UserNameScreen extends StatefulWidget {
  static const routeName = 'UserNameScreen';

  const UserNameScreen({Key? key}) : super(key: key);

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  final _usernameController = TextEditingController();
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.themeColor,
        appBar: ArrowAppBar(
          onBack: () {
            context.goNamed('SignInPage');
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
                  top: GlobalVariables.deviceHeight * 0.01,
                ),
                width: GlobalVariables.deviceWidth * 0.50,
                child: const CustomText(text: "What's your first name?"),
              ),
              Container(
                  margin: EdgeInsets.only(
                    top: GlobalVariables.deviceHeight * 0.03,
                  ),
                  width: GlobalVariables.deviceWidth * 0.75,
                  height: 60,
                  child: CustomTextField(
                      controller: _usernameController, saveKey: 'username')),
              Container(
                margin: EdgeInsets.only(
                  top: GlobalVariables.deviceHeight * 0.01,
                ),
                width: GlobalVariables.deviceWidth * 0.55,
                child: const CustomSmallText(
                    text: 'This info cannot be changed later'),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: GlobalVariables.deviceHeight * 0.04,
                ),
                child: CustomButton(
                  text: 'Next',
                  onTap: () async {
                    String username = _usernameController.text;

                    // Call the FirestoreService to update user data
                    await _firestoreService.createUserData(
                      _authService.currentUser?.uid ??
                          '', // Use the dynamic user ID or an empty string
                      username.isNotEmpty ? username : null,
                      '',
                      0,
                    );

                    context.goNamed(SnapchatScreen.routeName);
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
