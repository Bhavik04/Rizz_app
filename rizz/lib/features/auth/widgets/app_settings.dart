import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AppSettingsPopup extends StatelessWidget {
  final Permission permission;

  const AppSettingsPopup({Key? key, required this.permission})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Permission Required"),
      content: Text(
          "This app requires access to ${permission == Permission.location ? 'location' : 'photos'}. "
          "Would you like to open app settings to enable permission?"),
      actions: <Widget>[
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: const Text("Settings"),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
