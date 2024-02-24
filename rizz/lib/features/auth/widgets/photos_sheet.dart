import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';

class PhotoSheet extends StatefulWidget {
  @override
  _PhotoSheetState createState() => _PhotoSheetState();
}

class _PhotoSheetState extends State<PhotoSheet> {
  @override
  void initState() {
    super.initState();
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Add Photos',
                      style: TextStyle(
                        color: GlobalVariables.themeColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
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
        ],
      ),
    );
  }
}

void showPhotoSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    backgroundColor: const Color.fromARGB(255, 15, 15, 15),
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.8, //adjust sheet height
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return PhotoSheet();
        },
      );
    },
  );
}
