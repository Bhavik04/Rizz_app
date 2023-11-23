import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/screens/sign_in.dart';
import 'package:rizz/services/auth_service.dart';
import 'package:rizz/services/firestore_service.dart';
import 'package:rizz/services/storage_service.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      backgroundColor: GlobalVariables.themeColor,
      title: const Text(
        'Are you sure?',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      content: SizedBox(
        height: 120,
        width: 300,
        child: Column(
          children: [
            const Text(
              'If you delete your account, you will loose all your chats and data.',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    await onDelete(context);
                  },
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onDelete(BuildContext context) async {
    try {
      final uid = AuthService().currentUser?.uid;
      if (uid != null) {
        await AuthService().signOut();

        // Delete Firestore data
        await FirestoreService().deleteUserData(uid);

        // Delete Storage data
        await StorageService().deleteProfileImage(uid);

        // Delete Firebase Authentication data
        await AuthService().deleteUser();

        context.goNamed(SignInPage.routeName);
      }
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
