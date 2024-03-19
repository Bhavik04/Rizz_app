import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/screens/create_photo.dart';
import 'package:rizz/features/auth/widgets/custom_arrowbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/home/screens/loading_screen.dart';
import 'package:rizz/features/home/screens/play.dart';

import '../../../services/auth_service.dart';
import '../../../services/firestore_service.dart';

class CreateProfileScreen extends StatefulWidget {
  static const routeName = 'CreateProfileScreen';

  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('FF5C67'),
        appBar: ArrowBar(
          title: '',
          backgroundColor: HexColor('F33C5E'),
          onBack: () {
            context.goNamed(PhotoScreen.routeName);
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
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: GlobalVariables.deviceHeight * 0.05),
                    width: GlobalVariables.deviceWidth * 0.65,
                    child: const CustomText(
                        text: "Damn! you're looking hot as hell"),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: GlobalVariables.deviceHeight * 0.03),
                    height: GlobalVariables.deviceHeight * 0.520,
                    width: GlobalVariables.deviceWidth * 0.700,
                    decoration: BoxDecoration(
                      color: GlobalVariables.themeColor,
                      borderRadius: BorderRadius.circular(20),
                      image: PhotoScreen.selectedImage != null
                          ? DecorationImage(
                              image: FileImage(PhotoScreen.selectedImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: GlobalVariables.deviceHeight * 0.04),
                    child: CustomButton(
                      text: 'Go Slay',
                      onTap: () {
                        debugPrint('print button');
                        FirestoreService().createUserData(
                          AuthService().currentUser!.uid,
                          GlobalVariables.username,
                          GlobalVariables.snapchat,
                          GlobalVariables.age,
                          gender: GlobalVariables.gender,
                          photoURLs: GlobalVariables.photoURLs,
                        );
                        // context.goNamed(PlayScreen.routeName);
                        context.goNamed(LoadingScreen.routeName);
                      },
                      buttonColor: Colors.white,
                      textColor: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
