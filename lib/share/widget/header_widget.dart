import 'package:flutter/material.dart';
import 'package:saladapp/share/color/color_constan.dart';
import 'package:saladapp/share/widget/fontcustom_widget.dart';

// ignore: must_be_immutable
class HeaderWidget extends StatefulWidget {
  String title;
  String image;
  HeaderWidget({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.17,
      decoration: BoxDecoration(
        color: ColorsConstan.headerBackground,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: size.height * 0.086,
            child: Container(
                width: size.width,
                height: size.height * 0.057,
                color: const Color(0xffDBEC73)),
          ),
          Positioned(
            top: size.height * 0.086,
            left: size.width * 0.244,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: SizedBox(
                width: size.width * 0.756,
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: customFontBTB(
                      size.width * 0.047, const Color(0xff5F0F0F)),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.075,
            left: size.width * 0.08,
            child: CircleAvatar(
              backgroundColor: ColorsConstan.secondaryColor,
              radius: size.width * 0.08,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.023,
                    vertical: size.height * 0.011),
                child: Image.asset(widget.image),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
