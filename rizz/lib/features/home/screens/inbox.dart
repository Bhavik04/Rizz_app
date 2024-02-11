import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_appbar.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';
import 'package:rizz/features/auth/widgets/custom_popup.dart';

class InboxScreen extends StatefulWidget {
  static const routeName = 'InboxScreen';

  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  List<Widget> tabWidgetList = <Widget>[];

  void showCustomBottomSheet(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    
    tabWidgetList.add(RevealedInbox());
    tabWidgetList.add(Container(child: Text("ankush"),));

    return DefaultTabController(
      length: tabWidgetList.length,
       child: Builder(builder: (BuildContext context) {
          final tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            setState(() {});
          });
          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 239, 237, 237),
               appBar: CustomAppBar(
                  onLeftIconTap: () {},
                  onRightIconTap: () {},
                ),
              body: SafeArea(child: TabBarView(children: tabWidgetList)),

          );
        })
      );
    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: HexColor("141414"),
    //     appBar: CustomAppBar(
    //       onLeftIconTap: () {},
    //       onRightIconTap: () {},
    //     ),
    //     body: RevealedInbox(),
    //   ),
    // );
  }
}

class RevealedInbox extends StatelessWidget {
  const RevealedInbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        right: GlobalVariables.deviceWidth * 0.04,
        left: GlobalVariables.deviceWidth * 0.04,
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
                  child: SizedBox(
                    height: GlobalVariables.deviceHeight * 0.10,
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/heart.png',
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
