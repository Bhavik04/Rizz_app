import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({super.key});

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
              'If you will delete your account, you will loose all your data, chats & inbox ratings...',
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
                  onPressed: () {},
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
