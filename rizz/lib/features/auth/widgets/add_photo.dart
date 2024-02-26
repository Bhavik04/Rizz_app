import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rizz/features/auth/widgets/photos_sheet.dart';

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

void showPicUpdateSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    builder: (BuildContext context) {
      return _buildPicUpdateSheet(context);
    },
  );
}

Widget _buildPicUpdateSheet(BuildContext context) {
  return Container(
    color: Colors.transparent,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        _buildBottomSheetItem(
          context,
          'Change Photo',
          Colors.blue,
          18,
          FontWeight.normal,
          () async {
            final pickedImage =
                await ImagePicker().pickImage(source: ImageSource.gallery);

            if (pickedImage != null) {
              final newPhoto = File(pickedImage.path);
              updateImages(newPhoto);
            }

            Navigator.pop(context);
          },
        ),
        const Divider(
          height: 2,
        ),
        _buildBottomSheetItem(
          context,
          'Cancel',
          Colors.black,
          18,
          FontWeight.normal,
          () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 8),
      ],
    ),
  );
}

void updateImages(File newPhoto) {}

Widget _buildBottomSheetItem(
  BuildContext context,
  String title,
  Color textColor,
  double fontSize,
  FontWeight fontWeight,
  Function onTap,
) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: ListTile(
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    ),
  );
}
