import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';

class FeedbackDialog extends StatelessWidget {
  final TextEditingController feedbackController;
  final VoidCallback onCancel;
  final VoidCallback onSend;

  const FeedbackDialog({
    required this.feedbackController,
    required this.onCancel,
    required this.onSend,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900], 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), 
      ),
      title: const Text(
        'Send Feedback',
        style: TextStyle(color: Colors.white), 
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25), 
      content: Container(
        width: 300, 
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[800], 
          borderRadius: BorderRadius.circular(10), 
        ),
        child: TextField(
          controller: feedbackController,
          maxLines: null,
          style: const TextStyle(color: Colors.white), 
          decoration: const InputDecoration(
            hintText: 'Enter your feedback here',
            hintStyle: TextStyle(color: Colors.grey), 
            border: InputBorder.none, 
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onCancel,
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white), 
          ),
        ),
        ElevatedButton(
          onPressed: onSend,
          style: ElevatedButton.styleFrom(
            backgroundColor: GlobalVariables.themeColor, 
          ),
          child: const Text('Send',style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}
