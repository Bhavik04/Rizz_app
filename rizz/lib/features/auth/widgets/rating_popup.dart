import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/features/auth/widgets/custom_button.dart';

class RatingPopupp extends StatefulWidget {
  const RatingPopupp({Key? key}) : super(key: key);

  @override
  State<RatingPopupp> createState() => _RatingPopuppState();
}

class _RatingPopuppState extends State<RatingPopupp> {
  double _rating = 5;
  final InAppReview inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/heart.png',
            height: 80,
            width: 80,
          ),
          const Text(
            'Rate Slay',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                onTap: () {},
                text: 'Close',
                buttonColor: Colors.white,
                textColor: Colors.black,
                width: 100,
                height: 50,
                textSize: 15,
              ),
              CustomButton(
                onTap: () async {
                  if (_rating > 4) {
                    if (await inAppReview.isAvailable()) {
                      inAppReview.requestReview();
                    }
                    print('open playstore');
                  }
                },
                text: 'Submit',
                buttonColor: GlobalVariables.themeColor,
                textColor: Colors.white,
                width: 100,
                height: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
