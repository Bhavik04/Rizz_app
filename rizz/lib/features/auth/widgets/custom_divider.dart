import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';

class CustomDividerRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              top: GlobalVariables.deviceHeight * 0.03,
            ),
            alignment: Alignment.center,
            child: const Divider(
              color: Colors.grey,
              height: 1,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: GlobalVariables.deviceHeight * 0.03,
            left: 20,
            right: 20,
          ),
          child: const Text(
            'OR',
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              top: GlobalVariables.deviceHeight * 0.03,
            ),
            alignment: Alignment.center,
            child: const Divider(
              color: Colors.grey,
              height: 1,
            ),
          ),
        ),
      ],
    );
  }
}
