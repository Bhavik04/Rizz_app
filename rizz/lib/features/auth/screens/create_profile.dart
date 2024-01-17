import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/screens/create_photo.dart';
import 'package:rizz/features/auth/screens/onboardig.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';

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
        backgroundColor: GlobalVariables.themeColor,
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.10),
                  width: GlobalVariables.deviceWidth * 0.80,
                  child: const CustomText(
                      text: "Damn! you're looking hot as hell"),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                  height: GlobalVariables.deviceHeight * 0.520,
                  width: GlobalVariables.deviceWidth * 0.590,
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
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.04),
                  child: CustomButton(
                    text: 'Next',
                    onTap: () {
                      debugPrint('print button');
                      context.goNamed(OnboardScreen.routeName);
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
    );
  }
}
