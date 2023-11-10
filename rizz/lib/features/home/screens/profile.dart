import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_popup.dart';
import 'package:rizz/features/home/screens/play.dart';
import 'package:rizz/services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = 'ProfileScreen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('141414'),
        appBar: AppBar(
          backgroundColor: HexColor('141414'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: HexColor('FFFFFF'),
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.10),
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          onButtonTap: (buttonText) {
                            debugPrint('$buttonText button tapped');
                          },
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/images/subscription.png',
                    fit: BoxFit.contain,
                    height: GlobalVariables.deviceHeight * 0.19,
                    width: GlobalVariables.deviceWidth * 0.90,
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.03),
                child: CustomButton(
                  text: 'Send Feedback',
                  onTap: () async {
                    await AuthService().signOut();
                    debugPrint('Print button tapped');
                    context.goNamed(PlayScreen.routeName);
                  },
                  buttonColor: HexColor('693DE7'),
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
