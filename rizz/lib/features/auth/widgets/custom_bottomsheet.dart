import 'package:flutter/material.dart';
import 'package:rizz/features/auth/widgets/delete_sheet.dart';
import 'package:rizz/features/auth/widgets/preference_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.9,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return _buildCustomBottomSheet(context, scrollController);
        },
      );
    },
  );
}

Widget _buildCustomBottomSheet(
    BuildContext context, ScrollController scrollController) {
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
        Expanded(
          child: ListView(
            controller: scrollController,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 4, bottom: 0),
            children: [
              _buildBottomSheetItem(
                context,
                'Preference',
                Colors.deepPurple,
                null,
                FontWeight.normal,
                () {
                  Navigator.pop(context);
                  showPreferenceSheet(context);
                },
              ),
              const Divider(
                height: 2,
              ),
              _buildBottomSheetItem(
                context,
                'I need help',
                Colors.deepPurple,
                null,
                FontWeight.normal,
                () {
                  const String instagramLink =
                      'https://www.instagram.com/kash_2709';
                  launch(instagramLink);
                },
              ),
              const Divider(
                height: 2,
              ),
              _buildBottomSheetItem(
                context,
                'Settings',
                Colors.deepPurple,
                null,
                FontWeight.normal,
                () {
                  Navigator.pop(context);
                  showDeleteSheet(context);
                },
              ),
              const Divider(
                height: 2,
              ),
              _buildBottomSheetItem(
                context,
                'Restore purchases',
                Colors.deepPurple,
                null,
                FontWeight.normal,
                () {},
              ),
              const Divider(
                height: 2,
              ),
              _buildBottomSheetItem(
                context,
                'Close',
                null,
                18,
                FontWeight.bold,
                () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildBottomSheetItem(
  BuildContext context,
  String title,
  Color? textColor,
  double? fontSize,
  FontWeight? fontWeight,
  Function onTap,
) {
  return InkWell(
    enableFeedback: false,
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
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
