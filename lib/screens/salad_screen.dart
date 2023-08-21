import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:saladapp/models/imagedisease_model.dart';
import 'package:saladapp/models/salad_model.dart';
import 'package:saladapp/resource/assets_route.dart';
import 'package:saladapp/screens/detail_screen.dart';
import 'package:saladapp/services/api_handler.dart';
import 'package:saladapp/share/widget/bottom_sheet_navigator.dart';
import 'package:saladapp/share/widget/fontcustom_widget.dart';
import 'package:saladapp/share/widget/header_widget.dart';
import 'package:saladapp/share/widget/listview_widget.dart';

class SaladScreen extends StatefulWidget {
  const SaladScreen({super.key});

  @override
  State<SaladScreen> createState() => _SaladScreenState();
}

class _SaladScreenState extends State<SaladScreen> {
  List<Salad> saladList = [];
  List<ImageFetch> imageSalad = [];
  bool isLoading = false;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        APIHandler.fetchSaladData('saladlist').then((value) {
          saladList = value;
          if (saladList.isNotEmpty) {
            setState(() {
              isLoading = true;
            });
          }
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigatorWidget(screen: 2),
      body: SizedBox(
        child: Column(
          children: [
            HeaderWidget(
              title: "ប្រភេទនៃសាឡាដ",
              image: ImageAssets.logo,
            ),
            SizedBox(
              height: size.height * 0.021,
            ),
            isLoading == false
                ? Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05, top: size.height * 0.25),
                    child: LottieBuilder.asset(ImageAssets.progressapi,
                        width: size.width * 0.4, fit: BoxFit.contain),
                  )
                : Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: saladList.length,
                      itemBuilder: (context, index) {
                        var salad = saladList[index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.047),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(salad.saladname,
                                      style: customFontBTB(size.width * 0.047,
                                          const Color(0xff00677F))),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetialScreen(
                                                getId: salad.sid,
                                                getType: 'សាលាដ')),
                                      );
                                    },
                                    child: Text(
                                      'មើលបន្ថែម',
                                      style: customFontKoulen(
                                          size.width * 0.037,
                                          const Color(0xff00677F)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: size.height * 0.015,
                                  bottom: size.height * 0.015,
                                  left: size.width * 0.047),
                              padding: const EdgeInsets.all(5),
                              height: size.height * 0.13,
                              child: ListViewWidget(
                                type: 'សាលាដ',
                                imgtpye: salad.other,
                                size: size,
                                itemCount: 5,
                                imageSize: size.width * 0.35,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
            SizedBox(
              height: size.height * 0.011,
            )
          ],
        ),
      ),
    );
  }
}
