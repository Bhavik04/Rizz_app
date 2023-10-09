import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';

class UserNameScreen extends StatefulWidget {
  static const routeName = 'UserNameScreen';

  const UserNameScreen({super.key});

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: GlobalVariables.themeColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.20),
                child: Text(
                  "What's your first name?",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
            CustomButton(
              text: 'Next',
              onTap: () {
                debugPrint('h');
              },
            )
          ],
        ),
      ),
    ));
  }
}
