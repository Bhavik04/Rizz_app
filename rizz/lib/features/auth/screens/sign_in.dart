import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/screens/create_username.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/home/screens/loading_screen.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';

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
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.28),
                child: const Text('Welcome to the hottest app',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.02),
                child: Image.asset(
                  'assets/images/slay.png',
                  height: 110,
                ),
              ),
              SizedBox(
                height: GlobalVariables.deviceHeight * 0.28,
              ),
              CustomButton(
                text: "Signup with Google",
                image: Image.asset('assets/images/google.png'),
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
                    // Check if the user is new or existing
                    final bool isNewUser = await FirestoreService()
                        .checkIfNewUser(AuthService().currentUser?.uid ?? '');

                    if (isNewUser) {
                      // For a new user, navigate to the UserNameScreen
                      context.goNamed(UserNameScreen.routeName);
                    } else {
                      // For an existing user, navigate to the PlayScreen
                      // context.goNamed(PlayScreen.routeName);
                      context.goNamed(UserNameScreen.routeName);
                    }
                  } else {
                    // Handle the case where sign-in was not successful
                    // Add appropriate feedback to the user if needed
                    print('Sign-in not successful');
                  }
                },
                buttonColor: Colors.white,
                textColor: Colors.black,
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('button Tapped');
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: GlobalVariables.deviceWidth * 0.65,
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    text: const TextSpan(
                      style: TextStyle(color: Colors.white70),
                      children: [
                        TextSpan(
                          text: "By continuing, you agree to our ",
                        ),
                        TextSpan(
                          text: "terms",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: " and ",
                        ),
                        TextSpan(
                          text: "privacy policies",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: ".",
                        ),
                      ],
                    ),
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
