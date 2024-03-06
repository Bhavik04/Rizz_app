import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';

class SubscriptionBottomSheet extends StatefulWidget {
  const SubscriptionBottomSheet({super.key});

  @override
  _SubscriptionBottomSheetState createState() =>
      _SubscriptionBottomSheetState();
}

class _SubscriptionBottomSheetState extends State<SubscriptionBottomSheet> {
  String? selectedTag;

  // Constructor
  _SubscriptionBottomSheetState() {
    selectedTag = 'Most Popular';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _shadowContainer('₹ 79', 'Week', 'Most Popular'),
                    _shadowContainer('₹ 179', 'Month', 'Save 47%'),
                    _shadowContainer('₹ 699', 'Lifetime', 'Most Value'),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
                child: CustomButton(
                  text: 'Slay God',
                  buttonColor: HexColor('F24139'),
                  textColor: Colors.white,
                  width: GlobalVariables.deviceWidth * 0.9,
                //  height: GlobalVariables.deviceHeight * 0.09,
                height: 70,
                  textSize: 22,
                ),
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('button Tapped');
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: GlobalVariables.deviceWidth * 0.65,
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    text: const TextSpan(
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: "Terms",
                        ),
                        TextSpan(
                          text: " & ",
                        ),
                        TextSpan(
                          text: "privacy.",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _shadowContainer(String rupeesText, String durationText, String tag) {
    bool isSelected = selectedTag == tag;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (!isSelected) {
                selectedTag = tag;
              }
            });
          },
          child: Container(
            width: GlobalVariables.deviceWidth * 0.27,
          //  height: GlobalVariables.deviceHeight * 0.19,
          height: 135,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: isSelected ? Colors.red : Colors.white,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(1),
                    height: 20,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                   SizedBox(height: GlobalVariables.deviceHeight *0.02),
                  Text(
                    rupeesText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  Text(
                    durationText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
