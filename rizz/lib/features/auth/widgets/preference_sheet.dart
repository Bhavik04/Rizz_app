import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/widgets/filter.dart';
import 'package:rizz/features/auth/widgets/user_gender.dart';

class PreferenceSheet extends StatefulWidget {
  @override
  _PreferenceSheetState createState() => _PreferenceSheetState();
}

class _PreferenceSheetState extends State<PreferenceSheet> {
  late String selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(2),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
          ),
          Container(
            padding: EdgeInsets.only(right: GlobalVariables.deviceWidth * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 4, bottom: 0),
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.01),
                  padding:
                      EdgeInsets.only(left: GlobalVariables.deviceWidth * 0.04),
                  child: const Text(
                    'I wanna meet...',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: GlobalVariables.deviceHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GenderContainer(
                        text: 'Boy',
                        imagePath: 'assets/images/boy.png',
                        containerWidth: 120,
                        containerHeight: 40,
                        backgroundColor: Colors.black,
                        isSelected: selectedGender == 'Boy',
                        onTap: () {
                          setState(() {
                            selectedGender = 'Boy';
                          });
                          debugPrint('button Tapped: Boy');
                        },
                      ),
                      GenderContainer(
                        text: 'Girl',
                        imagePath: 'assets/images/girl.png',
                        containerWidth: 120,
                        containerHeight: 40,
                        backgroundColor: Colors.black,
                        isSelected: selectedGender == 'Girl',
                        onTap: () {
                          setState(() {
                            selectedGender = 'Girl';
                          });
                          debugPrint('button Tapped: Girl');
                        },
                      ),
                      GenderContainer(
                        text: 'Other',
                        containerWidth: 120,
                        containerHeight: 40,
                        backgroundColor: Colors.black,
                        isSelected: selectedGender == 'Other',
                        onTap: () {
                          setState(() {
                            selectedGender = 'Other';
                          });
                          debugPrint('button Tapped: Other');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showPreferenceSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    backgroundColor: const Color.fromARGB(255, 15, 15, 15),
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.6, //adjust sheet height
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return PreferenceSheet();
        },
      );
    },
  );
}
