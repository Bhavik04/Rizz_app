import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/screens/create_profile.dart';
import 'package:rizz/features/auth/screens/create_state.dart';
import 'package:rizz/features/auth/widgets/custom_backarrow.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';

class PhotoScreen extends StatefulWidget {
  static const routeName = 'PhotoScreen';

  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.themeColor,
        appBar: ArrowAppBar(
          onBack: () {
            context.goNamed(StateScreen.routeName);
          },
          title: '',
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                  width: GlobalVariables.deviceWidth * 0.55,
                  child: const CustomText(text: "Upload a photo of you!")),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                alignment: Alignment.center,
                width: GlobalVariables.deviceWidth * 0.500,
                height: GlobalVariables.deviceHeight * 0.500,
                child: Image.asset(
                  'assets/images/Rectangle.png',
                  height: GlobalVariables.deviceHeight * 0.500,
                  width: GlobalVariables.deviceWidth * 0.500,
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.06),
                child: CustomButton(
                  text: 'Pick your fav pic',
                  onTap: () {
                    debugPrint('print button');
                    context.goNamed(CreateProfileScreen.routeName);
                  },
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
