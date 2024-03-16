import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';

class CustomSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const CustomSlider({super.key, 
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        GlobalVariables.deviceWidth * 0.05,
        GlobalVariables.deviceHeight * 0.02,
        GlobalVariables.deviceWidth * 0.05,
        GlobalVariables.deviceHeight * 0.02,
      ),
      height: 95,
      decoration: BoxDecoration(
        color: Colors.white38,
        border: Border.all(color: Colors.white24, width: 2),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: HexColor('FF6B03'),
          inactiveTrackColor: Colors.white,
          thumbColor: Colors.redAccent,
          trackHeight: 7,
          valueIndicatorColor: Colors.black,
          valueIndicatorTextStyle: const TextStyle(fontSize: 16),
        ),
        child: Slider(
          value: value,
          min: 0,
          max: 10,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
