import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/screens/create_photo.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/services/auth_service.dart';

class SignInPage extends StatefulWidget {
  static const routeName = 'SignInPage';
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool signInSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.themeColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.33),
                child: Image.asset(
                  'assets/images/rizz_text.png',
                  height: 100,
                ),
              ),
              SizedBox(
                height: GlobalVariables.deviceHeight * 0.25,
              ),
              CustomButton(
                text: "Signup with Google",
                onTap: () async {
                  // Use the callback to update signInSuccess
                  await AuthService().signInWithGoogle(
                    onSignInComplete: (bool success) {
                      setState(() {
                        signInSuccess = success;
                      });
                    },
                  );

                  debugPrint("print button");

                  // Check signInSuccess before navigating
                  if (signInSuccess) {
                    context.goNamed(PhotoScreen.routeName);
                  } else {
                    // Handle the case where sign-in was not successful
                    // Add appropriate feedback to the user if needed
                    print('Sign-in not successful');
                  }
                },
                buttonColor: Colors.white,
                textColor: Colors.black,
              ),
              InkWell(
                onTap: () {
                  debugPrint('button Tapped');
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: GlobalVariables.deviceWidth * 0.65,
                  alignment: Alignment.center,
                  child: const Text(
                    "By continuing, you agree to our terms and privacy policies.",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
