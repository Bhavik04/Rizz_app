import 'package:flutter/material.dart';

void showSimpleBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    builder: (BuildContext context) {
      return _buildSimpleBottomSheet(context);
    },
  );
}

Widget _buildSimpleBottomSheet(BuildContext context) {
  return Container(
    color: Colors.transparent,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        _buildBottomSheetItem(
          context,
          'Skip User',
          Colors.blue,
          18,
          FontWeight.normal,
          () {},
        ),
        const Divider(
          height: 2,
        ),
        _buildBottomSheetItem(
          context,
          'Report',
          Colors.red,
          18,
          FontWeight.normal,
          () {},
        ),
        const Divider(
          height: 2,
        ),
        _buildBottomSheetItem(
          context,
          'Block User',
          Colors.black,
          18,
          FontWeight.normal,
          () {},
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
    onTap: () {
      onTap();
      Navigator.pop(context);
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
