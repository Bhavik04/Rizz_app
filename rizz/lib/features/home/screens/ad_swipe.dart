import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_text.dart';

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
        backgroundColor: HexColor("141414"),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: GlobalVariables.deviceHeight * 0.07,
                        ),
                        alignment: Alignment.center,
                        child: const Divider(
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: GlobalVariables.deviceHeight * 0.07,
                        left: 20,
                        right: 20,
                      ),
                      child: const Text(
                        'OR',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: GlobalVariables.deviceHeight * 0.07,
                        ),
                        alignment: Alignment.center,
                        child: const Divider(
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                    top: GlobalVariables.deviceHeight * 0.07,
                  ),
                  width: GlobalVariables.deviceWidth * 0.70,
                  alignment: Alignment.center,
                  child: const Text(
                    'Skip waiting time',
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
                  text: 'Watch Ads 0/2',
                  //play two ads
                  onTap: () {},
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
