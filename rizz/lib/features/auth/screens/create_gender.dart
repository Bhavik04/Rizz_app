import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/screens/create_age.dart';
import 'package:rizz/features/auth/screens/create_photo.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/auth/widgets/custom_text2.dart';
import 'package:rizz/features/auth/widgets/user_gender.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';

class GenderScreen extends StatefulWidget {
  static const routeName = 'GenderScreen';

  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();
  String? usergender;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.themeColor,
        appBar: ArrowBar(
          title: '',
          backgroundColor: GlobalVariables.themeColor,
          onBack: () {
            context.goNamed(AgeScreen.routeName);
          },
          showReportButton: false,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: GlobalVariables.deviceWidth * 0.1,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: GlobalVariables.deviceHeight * 0.03,
                ),
                width: GlobalVariables.deviceWidth * 0.55,
                child: const CustomText(
                  text: "What gender do you identify as?",
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GenderContainer(
                text: 'Boy',
                imagePath: 'assets/images/boy.png',
                containerWidth: 300,
                containerHeight: 60,
                backgroundColor: Colors.black,
                isSelected: usergender == 'Boy',
                onTap: () {
                  setState(() {
                    usergender = 'Boy';
                  });
                  debugPrint('button Tapped: Boy');
                },
              ),
              GenderContainer(
                text: 'Girl',
                imagePath: 'assets/images/girl.png',
                containerWidth: 300,
                containerHeight: 60,
                backgroundColor: Colors.black,
                isSelected: usergender == 'Girl',
                onTap: () {
                  setState(() {
                    usergender = 'Girl';
                  });
                  debugPrint('button Tapped: Girl');
                },
              ),
              GenderContainer(
                text: 'Other',
                containerWidth: 300,
                containerHeight: 60,
                backgroundColor: Colors.black,
                isSelected: usergender == 'Other',
                onTap: () {
                  setState(() {
                    usergender = 'Other';
                  });
                  debugPrint('button Tapped: Other');
                },
              ),
              Container(
                margin: EdgeInsets.only(
                  top: GlobalVariables.deviceHeight * 0.02,
                ),
                width: GlobalVariables.deviceWidth * 0.55,
                child: const CustomSmallText(
                  text: 'This info cannot be changed later',
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: GlobalVariables.deviceHeight * 0.04,
                ),
                child: CustomButton(
                  text: 'Next',
                  onTap: () async {
                    await _firestoreService.createUserData(
                      _authService.currentUser?.uid ?? '',
                      null,
                      null,
                      0,
                      gender: usergender,
                    );
                    context.goNamed(PhotoScreen.routeName);
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
