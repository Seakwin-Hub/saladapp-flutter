// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:saladapp/share/widget/fontcustom_widget.dart';

// ignore: must_be_immutable
class ContentDetial extends StatefulWidget {
  Size size;
  String title, content, getType;
  ContentDetial(
      {super.key,
      required this.size,
      required this.title,
      required this.content,
      required this.getType});

  @override
  State<ContentDetial> createState() => _ContentDetialState();
}

class _ContentDetialState extends State<ContentDetial> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.size.width,
          height: widget.size.height * 0.016,
          color: const Color(0xff8E8E8E).withOpacity(0.1),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              vertical: widget.size.height * 0.016,
              horizontal: widget.size.width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.getType == 'សាលាដ' ? widget.title : widget.title,
                style: customFontBTB(
                  widget.size.width * 0.04,
                  const Color.fromARGB(255, 9, 3, 3),
                ),
              ),
              SizedBox(
                height: widget.size.height * 0.019,
              ),
              Text(
                widget.getType == 'សាលាដ'
                    ? widget.content.replaceAll('\n', '')
                    : widget.content.replaceAll('-', ''),
                style: customFontBTB(widget.size.width * 0.036, Colors.black54),
                softWrap: true,
              ),
              SizedBox(
                height: widget.size.height * 0.019,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
