import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:saladapp/resource/assets_route.dart';
import 'package:saladapp/screens/login_screen.dart';
import 'package:saladapp/services/api_handler.dart';
import 'package:saladapp/share/color/color_constan.dart';
import 'package:saladapp/share/widget/fontcustom_widget.dart';

class FirstLaunch extends StatefulWidget {
  const FirstLaunch({super.key});

  @override
  State<FirstLaunch> createState() => _FirstLaunchState();
}

class _FirstLaunchState extends State<FirstLaunch> {
  bool isLoading = false;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      setState(() {
        APIHandler.fetchImageSalad('imagedata/salad/iceberg').then((value) {
          if (value.isNotEmpty) {
            setState(() {
              isLoading = true;
            });
          }
        });
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      if (isLoading == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsConstan.primaryBackgroundColor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.09, vertical: size.height * 0.1),
          child: Column(
            children: [
              Text(
                'សាលាដឃែរ',
                style: customFontBassac(
                    size.width * 0.140, const Color(0xff48435D)),
                overflow: TextOverflow.visible,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.054),
                child: Image.asset(
                  ImageAssets.logo,
                  width: size.width * 0.377,
                ),
              ),
              Expanded(
                child: Text(
                  'ការពារសាលាដរបស់អ្នក',
                  overflow: TextOverflow.visible,
                  style: customFontBassac(
                      size.width * 0.093, const Color(0xff4A31A2)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ជាមួយ',
                    style: customFontBassac(
                        size.width * 0.128, const Color(0xffFFFFFF)),
                  ),
                  SizedBox(
                    width: size.width * 0.023,
                  ),
                  Text(
                    'យើង',
                    style: customFontBassac(
                        size.width * 0.233, const Color(0xff48525A)),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Expanded(
                child: LottieBuilder.asset(
                  ImageAssets.loadingSplash,
                  width: size.width * 0.2,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
