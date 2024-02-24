import 'package:flutter/material.dart';

void showSkipSheet(BuildContext context, {bool includeSkipUser = true}) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    builder: (BuildContext context) {
      return _buildSkipSheet(context, includeSkipUser);
    },
  );
}

Widget _buildSkipSheet(BuildContext context, bool includeSkipUser) {
  return Container(
    color: Colors.transparent,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        if (includeSkipUser)
          _buildBottomSheetItem(
            context,
            'Skip User',
            Colors.lightBlue,
            18,
            FontWeight.normal,
            () {},
          ),
        if (includeSkipUser)
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
    enableFeedback: false,
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
