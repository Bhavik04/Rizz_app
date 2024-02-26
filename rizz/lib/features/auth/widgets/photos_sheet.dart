import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/widgets/add_photo.dart';

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
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildPhotoContainer('assets/images/image1.png'),
              buildPhotoContainer(''),
              buildPhotoContainer(''),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPhotoContainer(String imagePath) {
    bool hasImage = imagePath.isNotEmpty; // Check if the container has an image

    return GestureDetector(
      onTap: () {
        showPicUpdateSheet(context);
      },
      child: Stack(
        children: [
          Container(
            width: 110,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: hasImage
                ? Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: Icon(
                      Icons.add,
                      size: 40,
                      color: GlobalVariables.themeColor,
                    ),
                  ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Transform.translate(
              offset: Offset(15, -15),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: GlobalVariables.themeColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  hasImage ? Icons.remove : Icons.add,
                  color: Colors.white,
                ),
              ),
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
        initialChildSize: 0.8,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return PhotoSheet();
        },
      );
    },
  );
}
