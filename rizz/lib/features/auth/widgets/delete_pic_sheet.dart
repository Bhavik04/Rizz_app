import 'package:flutter/material.dart';

void showDeleteBottomSheet(
    BuildContext context, int imageIndex, Function onDelete) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    builder: (BuildContext context) {
      return _buildDeleteBottomSheet(context, imageIndex, onDelete);
    },
  );
}

Widget _buildDeleteBottomSheet(
    BuildContext context, int imageIndex, Function onDelete) {
  return Container(
    color: Colors.transparent,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        _buildBottomSheetItem(
          context,
          'Delete Photo',
          Colors.red,
          18,
          FontWeight.normal,
          () {
            onDelete(imageIndex);
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

Widget _buildBottomSheetItem(
  BuildContext context,
  String title,
  Color textColor,
  double fontSize,
  FontWeight fontWeight,
  Function onTap,
) {
  return InkWell(
    onTap: onTap as void Function()?,
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
