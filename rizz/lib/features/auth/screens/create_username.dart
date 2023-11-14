import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/screens/create_snapchat.dart';
import 'package:rizz/features/auth/widgets/custom_backarrow.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/auth/widgets/custom_text2.dart';

class UserNameScreen extends StatefulWidget {
  static const routeName = 'UserNameScreen';

  const UserNameScreen({super.key});

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

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
              horizontal: GlobalVariables.deviceWidth * 0.1),
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
                width: GlobalVariables.deviceWidth * 0.50,
                child: const CustomText(text: "What's your first name?"),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                width: GlobalVariables.deviceWidth * 0.75,
                height: 60,
                child: TextField(
                  controller: _usernameController,
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
                    text: 'This info cannot be changed later'),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.04),
                child: CustomButton(
                  text: 'Next',
                  onTap: () {
                    debugPrint('print button');
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
