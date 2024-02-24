import 'package:flutter/material.dart';
import 'package:rizz/services/firestore_service.dart';
import 'package:rizz/services/auth_service.dart';

class ProfileInfoTile extends StatelessWidget {
  final String field;
  final Key? key;
  final TextStyle? style;

  const ProfileInfoTile({
    this.key,
    required this.field,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: FirestoreService().getUserData(AuthService().currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final userData = snapshot.data;
          final dynamic value = userData?[field] ?? 'No data';

          return Text(
            '$value',
            key: key,
            style: style,
          );
        }
      },
    );
  }
}
