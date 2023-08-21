import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saladapp/resource/assets_route.dart';
import 'package:saladapp/screens/all_screen.dart';
import 'package:saladapp/screens/camera_screen.dart';
import 'package:saladapp/screens/disease_screen.dart';
import 'package:saladapp/screens/profile_screen.dart';
import 'package:saladapp/screens/salad_screen.dart';
import 'package:saladapp/share/color/color_constan.dart';

// ignore: must_be_immutable
class BottomNavigatorWidget extends StatefulWidget {
  int screen;
  BottomNavigatorWidget({super.key, required this.screen});

  @override
  State<BottomNavigatorWidget> createState() => _BottomNavigatorWidgetState();
}

class _BottomNavigatorWidgetState extends State<BottomNavigatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsConstan.secondaryColor.withOpacity(0.7),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllScreen(),
                    ));
              },
              icon: Icon(
                Icons.home,
                color: widget.screen == 1
                    ? Colors.blue
                    : ColorsConstan.primaryBackgroundColor,
                size: 26,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SaladScreen(),
                      ));
                },
                child: SvgPicture.asset(
                  ImageAssets.salad,
                  width: 26,
                  height: 26,
                  // ignore: deprecated_member_use
                  color: widget.screen == 2
                      ? Colors.blue
                      : ColorsConstan.primaryBackgroundColor,
                )),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CameraScreen(),
                    ));
              },
              icon: Icon(
                Icons.camera_alt,
                color: widget.screen == 3
                    ? Colors.blue
                    : ColorsConstan.primaryBackgroundColor,
                size: 26,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DiseaseScreen(),
                    ));
              },
              icon: Icon(
                Icons.coronavirus_sharp,
                color: widget.screen == 4
                    ? Colors.blue
                    : ColorsConstan.primaryBackgroundColor,
                size: 26,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ));
              },
              icon: Icon(
                Icons.person,
                color: widget.screen == 5
                    ? Colors.blue
                    : ColorsConstan.primaryBackgroundColor,
                size: 26,
              )),
        ],
      ),
    );
  }
}
