import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rizz/features/auth/screens/sign_in.dart';
import 'package:rizz/services/storage_service.dart';
import 'package:rizz/services/firestore_service.dart';
import 'package:rizz/services/auth_service.dart';

class CustomPopup extends StatelessWidget {
  final String uid;

  const CustomPopup({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      backgroundColor: Colors.deepPurpleAccent,
      title: const Text(
        'Are you sure?',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      content: SizedBox(
        height: 120,
        width: 300,
        child: Column(
          children: [
            const Text(
              'If you will delete your account, you will lose all your data, chats & inbox ratings...',
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      // Delete profile image from Firebase Storage
                      await StorageService().deleteProfileImage(uid);

                      // Delete user data from Firestore
                      await FirestoreService().deleteUserData(uid);

                      // Delete the user from Firebase Authentication
                      await AuthService().deleteUser();

                      // Additional logic if needed
                      context.goNamed(SignInPage.routeName);
                    } catch (e) {
                      // Handle the error, show a message, or log it
                      print('Error deleting user data: $e');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white24,
                  ),
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
