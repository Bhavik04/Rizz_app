import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
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
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.10),
                  width: GlobalVariables.deviceWidth * 0.55,
                  child: const CustomText(text: "Upload a photo of you!")),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.04),
                child: CustomButton(
                  text: 'Pick your fav pic',
                  onTap: () {
                    debugPrint('print button');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
