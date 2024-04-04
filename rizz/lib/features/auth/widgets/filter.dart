import 'package:flutter/material.dart';
import 'package:rizz/common/global_variables.dart';
import 'package:rizz/common/utils.dart';

class FilterWidget extends StatefulWidget {
  final String label;
  final String value;
  final bool isSelected;
  final Function onTap;

  const FilterWidget({
    super.key,
    required this.label,
    required this.value,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        key: Key('${widget.label}-${widget.value}'),
        padding: const EdgeInsets.all(8),
        width: GlobalVariables.deviceWidth * 0.30,
        height: GlobalVariables.deviceHeight * 0.06,
        decoration: BoxDecoration(
          border: Border.all(color: HexColor('FD630F'), width: 1),
          borderRadius: BorderRadius.circular(20),
          color: widget.isSelected ? HexColor('FD630F') : HexColor('FEFEFE'),
        ),
        child: Center(
          child: Text(
            widget.value,
            style: TextStyle(
              color: widget.isSelected ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
