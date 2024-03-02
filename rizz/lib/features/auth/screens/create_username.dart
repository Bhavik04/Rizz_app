import 'package:flutter/material.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/screens/create_snapchat.dart';
import 'package:rizz/features/auth/screens/sign_in.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/widgets/custom_textfield.dart';
import 'package:go_router/go_router.dart';

class UserNameScreen extends StatefulWidget {
  static const routeName = 'UserNameScreen';

  const UserNameScreen({Key? key}) : super(key: key);

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  final _usernameController = TextEditingController();
  bool _isUsernameValid = false;

  @override
  void initState() {
    super.initState();

    // Add listener to update _isUsernameValid when the text changes
    _usernameController.addListener(() {
      setState(() {
        _isUsernameValid = _usernameController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ArrowBar(
          title: '',
          backgroundColor: HexColor('F33C5E'),
          onBack: () {
            context.goNamed(SignInPage.routeName);
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
                  width: GlobalVariables.deviceWidth * 0.45,
                  child: const CustomText(text: "What's your first name?"),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: GlobalVariables.deviceHeight * 0.03,
                  ),
                  width: GlobalVariables.deviceWidth * 0.75,
                  height: 60,
                  child: CustomTextField(
                    controller: _usernameController,
                    saveKey: 'username',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: GlobalVariables.deviceHeight * 0.01,
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
                      if (_isUsernameValid) {
                        String username = _usernameController.text;

                        // Call the FirestoreService to update user data
                        // await _firestoreService.createUserData(
                        //   _authService.currentUser?.uid ?? '',
                        //   username.isNotEmpty ? username : null,
                        //   '',
                        //   0,
                        // );
                        GlobalVariables.username = username;

                        context.goNamed(SnapchatScreen.routeName);
                      }
                    },
                    buttonColor:
                        _isUsernameValid ? Colors.white : Colors.white70,
                    textColor: _isUsernameValid ? Colors.black : Colors.white,
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
