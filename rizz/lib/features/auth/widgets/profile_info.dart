import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/services/firestore_service.dart';
import 'package:rizz/services/auth_service.dart';

class ProfileInfoTile extends StatelessWidget {
  final String label;
  final String field;

  const ProfileInfoTile({super.key, required this.label, required this.field});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      height: GlobalVariables.deviceHeight * 0.06,
      width: GlobalVariables.deviceWidth * 0.48,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.transparent,
          width: 0,
        ),
      ),
      child: FutureBuilder<Map<String, dynamic>?>(
        future: FirestoreService().getUserData(AuthService().currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final userData = snapshot.data;
            final value = userData?[field] ?? 'No $label';
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '$label: $value',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            );
          }
        },
      ),
    );
  }
}
