import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/screens/create_age.dart';
import 'package:rizz/features/auth/screens/create_state.dart';
import 'package:rizz/features/auth/widgets/custom_backarrow.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/auth/widgets/custom_text2.dart';

class GenderScreen extends StatefulWidget {
  static const routeName = 'GenderScreen';

  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
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
              horizontal: GlobalVariables.deviceWidth * 0.1),
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                width: GlobalVariables.deviceWidth * 0.55,
                child: const CustomText(
                  text: "What gender do you identify as?",
                ),
              ),
              InkWell(
                onTap: () {
                  debugPrint('button Tapped');
                  context.goNamed(StateScreen.routeName);
                },
                child: Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.05),
                  width: GlobalVariables.deviceWidth * 0.75,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Boy',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/images/boy.png',
                        height: 30,
                        width: 30,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  debugPrint('button Tapped');
                  context.goNamed(StateScreen.routeName);
                },
                child: Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
                  width: GlobalVariables.deviceWidth * 0.75,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Girl',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/images/girl.png',
                        height: 30,
                        width: 30,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  debugPrint('button Tapped');
                  context.goNamed(StateScreen.routeName);
                },
                child: Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
                  width: GlobalVariables.deviceWidth * 0.75,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Center(
                    child: Text(
                      'Other',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.02),
                width: GlobalVariables.deviceWidth * 0.55,
                child: const CustomSmallText(
                  text: 'This info cannot be changed later',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
