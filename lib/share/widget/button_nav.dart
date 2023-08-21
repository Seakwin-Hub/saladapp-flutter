// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:saladapp/resource/assets_route.dart';
import 'package:saladapp/screens/all_screen.dart';
import 'package:saladapp/screens/camera_screen.dart';
import 'package:saladapp/screens/disease_screen.dart';
import 'package:saladapp/screens/profile_screen.dart';
import 'package:saladapp/screens/salad_screen.dart';
import 'package:saladapp/share/color/color_constan.dart';

class BottomNavBarNew extends StatefulWidget {
  const BottomNavBarNew({super.key});

  @override
  State<BottomNavBarNew> createState() => _BottomNavBarNewState();
}

class _BottomNavBarNewState extends State<BottomNavBarNew> {
  List<Widget> pages = [
    const AllScreen(),
    const SaladScreen(),
    const CameraScreen(),
    const DiseaseScreen(),
    const ProfileScreen(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        backgroundColor: ColorsConstan.secondaryColor.withOpacity(0.7),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(ImageAssets.home), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(ImageAssets.saladbar), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(ImageAssets.camerabar), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(ImageAssets.diseasebar), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(ImageAssets.userbar), label: ''),
        ],
      ),
    );
  }
}
