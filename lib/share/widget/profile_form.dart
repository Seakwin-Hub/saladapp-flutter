import 'package:flutter/material.dart';
import 'package:saladapp/share/widget/fontcustom_widget.dart';

// ignore: must_be_immutable
class ProfileField extends StatefulWidget {
  Size size;
  String lblText, textInbox;
  bool pwStyle, isEdit;

  ProfileField(
      {super.key,
      required this.size,
      required this.lblText,
      required this.pwStyle,
      required this.isEdit,
      required this.textInbox});

  @override
  State<ProfileField> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<ProfileField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: widget.size.width * 0.03),
          child: Text(widget.lblText,
              style: customFontSR(widget.size.width * 0.025,
                  const Color(0xff5F5F5F).withOpacity(0.8))),
        ),
        TextFormField(
          obscureText: widget.pwStyle,
          readOnly: widget.isEdit,
          controller: TextEditingController(text: widget.textInbox),
          style: customFontSR(
            widget.size.width * 0.03,
            const Color(0xff5F5F5F),
          ),
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            isDense: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 183, 147, 69), width: 1.5)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 183, 147, 69), width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.symmetric(
                horizontal: widget.size.width * 0.04,
                vertical: widget.size.height * 0.012),
          ),
        ),
      ],
    );
  }
}
