import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_divider.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';
import 'package:rizz/features/auth/widgets/rating_popup.dart';

class AdswipeScreen extends StatefulWidget {
  static const routeName = 'AdswipeScreen';

  const AdswipeScreen({Key? key}) : super(key: key);

  @override
  State<AdswipeScreen> createState() => _AdswipeScreenState();
}

class _AdswipeScreenState extends State<AdswipeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.2),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/lock.png',
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: GlobalVariables.deviceHeight * 0.02,
                ),
                width: GlobalVariables.deviceWidth * 0.70,
                child: const CustomText(text: "Oops! out of swipes"),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: GlobalVariables.deviceHeight * 0.01,
                ),
                width: GlobalVariables.deviceWidth * 0.70,
                child: const CustomText(text: "2:59:59"),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: CustomDividerRow()),
              Container(
                  margin: EdgeInsets.only(
                    top: GlobalVariables.deviceHeight * 0.05,
                  ),
                  width: GlobalVariables.deviceWidth * 0.70,
                  alignment: Alignment.center,
                  child: const Text(
                    'watch an ad to skip waiting time',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.02),
                child: CustomButton(
                  text: 'Watch',
                  //play two ads
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return RatingPopupp();
                      },
                    );
                  },
                  buttonColor: HexColor('F24139'),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
