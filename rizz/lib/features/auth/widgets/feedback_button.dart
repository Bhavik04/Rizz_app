import 'package:flutter/material.dart';
import 'package:rizz/features/auth/widgets/feedback_popup.dart';

class CustomFeedbackButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final double borderRadius;
  final double height;
  final double width;

  const CustomFeedbackButton({
    this.text = 'Send Feedback',
    this.buttonColor = Colors.red,
    this.textColor = Colors.white,
    this.borderRadius = 10,
    this.height = 65,
    this.width = 350,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          _showFeedbackDialog(context);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void _showFeedbackDialog(BuildContext context) {
    TextEditingController feedbackController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FeedbackDialog(
          feedbackController: feedbackController,
          onCancel: () {
            Navigator.of(context).pop();
          },
          onSend: () {
            // Handle sending feedback here
            String feedback = feedbackController.text;
            print('Sending feedback: $feedback');
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
