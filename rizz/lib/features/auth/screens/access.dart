import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/screens/create_gender.dart';
import 'package:rizz/features/auth/screens/create_photo.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';

class AcessScreen extends StatefulWidget {
  static const routeName = 'AcessScreen';

  const AcessScreen({Key? key}) : super(key: key);

  @override
  State<AcessScreen> createState() => _AcessScreenState();
}

class _AcessScreenState extends State<AcessScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ArrowBar(
          title: 'Please allow access',
          textPadding: EdgeInsets.only(right: GlobalVariables.deviceWidth * 0.09),
          titleColor: Colors.white,
          backgroundColor: HexColor('F33C5E'),
          onBack: () {
            context.goNamed(GenderScreen.routeName);
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
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: GlobalVariables.deviceWidth * 0.1),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.07),
                      width: GlobalVariables.deviceWidth * 0.55,
                      child: Image.asset('assets/images/slaytext.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.02),
                      width: GlobalVariables.deviceWidth * 0.65,
                      child: const Text(
                        'Slay needs to create your profile and give location based experience ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.08),
                      child: CustomButton(
                        text: 'Enable location',
                        textColor: Colors.white,
                        buttonColor: Colors.black,
                        image: Image.asset('assets/images/location.png'),
                        onTap: () {
                          context.goNamed(PhotoScreen.routeName);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
                      child: CustomButton(
                        text: 'Enable gallery',
                        textColor: Colors.white,
                        buttonColor: Colors.black,
                        image: Image.asset('assets/images/gallery.png'),
                        onTap: () {
                          context.goNamed(PhotoScreen.routeName);
                        },
                      ),
                    ),
                    SizedBox(
                      height: GlobalVariables.deviceHeight * 0.62,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: GlobalVariables.deviceWidth * 0.0),
                  color: HexColor('FF8A41'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/tinylock.png'),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: GlobalVariables.deviceWidth * 0.65,
                        child: const Text(
                          'Slay cares intensily about your privacy. We will never misuse your data. ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
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
