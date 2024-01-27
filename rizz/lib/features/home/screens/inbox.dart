import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_appbar.dart';

class InboxScreen extends StatefulWidget {
  static const routeName = 'InboxScreen';

  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  void showCustomBottomSheet(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("141414"),
        appBar: CustomAppBar(
          onLeftIconTap: () {},
          onRightIconTap: () {},
        ),
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
              right: GlobalVariables.deviceWidth * 0.04,
              left: GlobalVariables.deviceWidth * 0.04),
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  context.goNamed('BlurredScreen');
                },
                child: Card(
                  color: Colors.deepPurpleAccent,
                  elevation: 2.0,
                  child: SizedBox(
                    height: GlobalVariables.deviceHeight * 0.10,
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/thunder.png',
                        width: 35.0,
                        height: 35.0,
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
        ),
      ),
    );
  }
}
