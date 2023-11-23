import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String saveKey;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.saveKey,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_filterSpaces);
  }

  void _filterSpaces() {
    if (widget.controller.text.contains(' ')) {
      widget.controller.text = widget.controller.text.replaceAll(' ', '');
      widget.controller.selection = TextSelection.fromPosition(
        TextPosition(offset: widget.controller.text.length),
      );
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_filterSpaces);
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: widget.controller,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
        maxLength: 20,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        cursorColor: Colors.black12,
        inputFormatters: [
          FilteringTextInputFormatter.deny(' ')
        ], // Added input formatter
        decoration: InputDecoration(
          counterText: "",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.white.withOpacity(0.5),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
