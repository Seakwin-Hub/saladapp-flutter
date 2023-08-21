import 'package:flutter/material.dart';
import 'package:saladapp/share/widget/fontcustom_widget.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  Size size;
  String lblText;
  bool pwStyle;
  TextEditingController controller;
  Function(String) onChanged;

  TextFieldWidget(
      {super.key,
      required this.size,
      required this.lblText,
      required this.pwStyle,
      required this.controller,
      required this.onChanged});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: widget.pwStyle,
      style: customFontSR(widget.size.width * 0.03,
          const Color.fromARGB(255, 50, 17, 55).withOpacity(0.8)),
      decoration: InputDecoration(
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 61, 200, 36), width: 2)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 74, 188, 74), width: 2),
              borderRadius: BorderRadius.circular(8)),
          contentPadding: EdgeInsets.symmetric(
              horizontal: widget.size.width * 0.04,
              vertical: widget.size.height * 0.012),
          labelText: widget.lblText,
          labelStyle: customFontSR(widget.size.width * 0.033,
              const Color(0xff5F5F5F).withOpacity(0.5))),
    );
  }
}
