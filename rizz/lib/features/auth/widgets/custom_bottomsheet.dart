import 'package:flutter/material.dart';
import 'package:rizz/features/auth/widgets/delete_popup.dart';

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
                'Follow us on Instagram',
                Colors.red,
                20,
                FontWeight.bold,
                () {},
              ),
              const Divider(
                height: 2,
              ),
              _buildBottomSheetItem(
                context,
                'I need help',
                Colors.deepPurple,
                null,
                FontWeight.bold,
                () {},
              ),
              const Divider(
                height: 2,
              ),
              _buildBottomSheetItem(
                context,
                'Delete account',
                Colors.deepPurple,
                null,
                FontWeight.bold,
                () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CustomPopup();
                    },
                  );
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
                FontWeight.bold,
                () {},
              ),
              const Divider(
                height: 2,
              ),
              _buildBottomSheetItem(
                context,
                'Close',
                null,
                20,
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
