import 'package:flutter/material.dart';
import 'package:rizz/features/auth/widgets/delete_popup.dart';

void showDeleteSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    builder: (BuildContext context) {
      return _buildDeleteSheet(context);
    },
  );
}

Widget _buildDeleteSheet(BuildContext context) {
  return Container(
    color: Colors.transparent,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        _buildBottomSheetItem(
          context,
          'Privacy policy',
          Colors.black,
          18,
          FontWeight.normal,
          () {},
        ),
        const Divider(
          height: 2,
        ),
        _buildBottomSheetItem(
          context,
          'Terms of use',
          Colors.black,
          18,
          FontWeight.normal,
          () {},
        ),
        const Divider(
          height: 2,
        ),
        _buildBottomSheetItem(
          context,
          'Delete account',
          Colors.red,
          18,
          FontWeight.normal,
          () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const CustomPopup();
              },
            );
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
