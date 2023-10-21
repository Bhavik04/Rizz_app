import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/screens/create_state.dart';
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
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.10),
                  width: GlobalVariables.deviceWidth * 0.55,
                  child: const CustomText(
                      text: "What gender do you identify as?")),
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
                      borderRadius: BorderRadius.circular(40)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Boy',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.male,
                        color: Colors.white,
                        size: 30,
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
                      borderRadius: BorderRadius.circular(40)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Girl',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.female,
                        color: Colors.white,
                        size: 30,
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
                      borderRadius: BorderRadius.circular(40)),
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
                      text: 'This info cannot be changed later')),
            ],
          ),
        ),
      ),
    );
  }
}
