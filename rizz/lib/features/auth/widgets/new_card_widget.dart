import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';

class NewCardWidget extends StatefulWidget {
  const NewCardWidget({super.key});

  @override
  State<NewCardWidget> createState() => _NewCardWidgetState();
}

// card should get deleted after 24 hours

class _NewCardWidgetState extends State<NewCardWidget> {
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
                  context.goNamed('BlurredScreen');
                },
                child: Card(
                  color: Colors.deepPurpleAccent,
                  elevation: 2.0,
                  child: Container(
                    height: 70,
                    padding: EdgeInsets.only(
                        bottom: GlobalVariables.deviceHeight * 0.02),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/heart.png',
                        width: 42.0,
                        height: 42.0,
                      ),
                      title: const Center(
                        child: Text(
                          'Someone rizzed you',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      trailing: const Text(
                        '22h left',
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
                    context.goNamed('SubscriptionScreen');
                  },
                  text: 'See who likes you',
                  image: Image.asset('assets/images/likesyou.png'),
                  buttonColor: HexColor('F24139'),
                  textColor: Colors.white,
                  width: GlobalVariables.deviceWidth * 0.8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
