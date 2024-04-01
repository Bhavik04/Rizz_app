import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/home/screens/blurred_screen.dart';

class NewCardWidget extends StatefulWidget {
  final String uId;
  final String rating;
  const NewCardWidget({super.key, required this.uId, required this.rating});

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
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              context.goNamed(BlurredScreen.routeName, queryParameters: {
                'uId': widget.uId,
                'rating': widget.rating
              });
            },
            child: Card(
              color: Colors.deepPurpleAccent,
              elevation: 2.0,
              child: Container(
                height: 70,
                padding: EdgeInsets.only(
                  bottom: GlobalVariables.deviceHeight * 0.02,
                ),
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
    );
  }
}
