import 'package:flutter/material.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/utils.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("eb6d2e"),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 250),
              child: Image.asset(
                'assets/images/rizz_text.png',
                height: 100,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            CustomButton(
              text: "Start the fun!",
              onTap: () {
                debugPrint("print button");
              },
            ),
            InkWell(
              onTap: () {
                debugPrint('button Tapped');
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                width: 250,
                alignment: Alignment.center,
                child: const Text(
                  "By continuing, you agree to our terms and privacy policies.",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}