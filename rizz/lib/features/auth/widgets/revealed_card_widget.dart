import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_popup.dart';

class RevealedCardWidget extends StatefulWidget {
  @override
  State<RevealedCardWidget> createState() => _RevealedCardWidgetState();
}

class _RevealedCardWidgetState extends State<RevealedCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        right: GlobalVariables.deviceWidth * 0.04,
        left: GlobalVariables.deviceWidth * 0.04,
        top: GlobalVariables.deviceHeight * 0.01,
      ),
      child: Stack(
        children: [
          ListView(
            children: [
              GestureDetector(
                onTap: () {
                  context.goNamed('SnapRevealedScreen');
                },
                child: Card(
                  color: HexColor('3555FF'),
                  elevation: 2.0,
                  child: Container(
                    height: GlobalVariables.deviceHeight * 0.10,
                    padding: EdgeInsets.only(
                        bottom: GlobalVariables.deviceHeight * 0.02),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/heart.png',
                        width: 45.0,
                        height: 45.0,
                      ),
                      title: const Center(
                        child: Text(
                          'Revealed messages ',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      trailing: const Text(
                        '',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 30.0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CustomButton(
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
                  text: 'See who likes you',
                  image: Image.asset('assets/images/likesyou.png'),
                  buttonColor: HexColor('F24139'),
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
