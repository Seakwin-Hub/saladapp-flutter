import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saladapp/screens/first_launch_screen.dart';
import 'package:saladapp/share/color/build_material_color.dart';
import 'package:saladapp/share/color/color_constan.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: buildMaterialColor(ColorsConstan.primaryBackgroundColor),
      ),
      home: const FirstLaunch(),
    );
  }
}
