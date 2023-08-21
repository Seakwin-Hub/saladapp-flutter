import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:saladapp/models/disease_model.dart';
import 'package:saladapp/resource/assets_route.dart';
import 'package:saladapp/screens/detail_screen.dart';
import 'package:saladapp/services/api_handler.dart';
import 'package:saladapp/share/widget/bottom_sheet_navigator.dart';
import 'package:saladapp/share/widget/fontcustom_widget.dart';
import 'package:saladapp/share/widget/header_widget.dart';
import 'package:saladapp/share/widget/listview_widget.dart';

class DiseaseScreen extends StatefulWidget {
  const DiseaseScreen({super.key});

  @override
  State<DiseaseScreen> createState() => _DiseaseScreenState();
}

class _DiseaseScreenState extends State<DiseaseScreen> {
  List<Disease> diseaseList = [];
  bool isLoading = false;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        APIHandler.fetchDiseaseData('diseaselist').then((value) {
          diseaseList = value;
          if (diseaseList.isNotEmpty) {
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
      bottomNavigationBar: BottomNavigatorWidget(
        screen: 4,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(
            title: "ប្រភេទនៃជំងឺសាលាដ",
            image: ImageAssets.virus,
          ),
          SizedBox(
            height: size.height * 0.021,
          ),
          isLoading == false
              ? Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.3, top: size.height * 0.3),
                  child: LottieBuilder.asset(ImageAssets.progressapi,
                      width: size.width * 0.4, fit: BoxFit.contain),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.047),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ជំងឺទាំងអស់',
                                  style: customFontBTB(size.width * 0.04,
                                      const Color(0xff00677F))),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DiseaseScreen()),
                                  );
                                },
                                child: Text(
                                  'មើលបន្ថែម',
                                  style: customFontKoulen(size.width * 0.037,
                                      const Color(0xff00677F)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: size.height * 0.015,
                              left: size.width * 0.04),
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.005,
                              horizontal: size.width * 0.012),
                          height: size.height * 0.18,
                          child: ListViewWidget(
                            imgtpye: 'alldisease',
                            type: '',
                            size: size,
                            itemCount: diseaseList.length,
                            imageSize: size.width * 0.43,
                          ),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                          itemCount: diseaseList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var disease = diseaseList[index];
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
                                      Text(
                                          disease.disease == 'ផ្សិត'
                                              ? 'ជំងឺ${disease.disease} : ${disease.typeofdisease}'
                                              : 'ជំងឺ${disease.disease}',
                                          style: customFontBTB(
                                              size.width * 0.035,
                                              const Color(0xff00677F))),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetialScreen(
                                                          getId: disease.did,
                                                          getType: 'ជំងឺ')));
                                        },
                                        child: Text(
                                          'មើលបន្ថែម',
                                          style: customFontKoulen(
                                              size.width * 0.035,
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
                                      left: size.width * 0.047,
                                      right: size.width * 0.05),
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.005,
                                      horizontal: size.width * 0.012),
                                  height: size.height * 0.15,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                          color: Color.fromRGBO(
                                              255, 236, 179, 0.2),
                                        ),
                                      ],
                                      gradient: const LinearGradient(
                                          colors: [
                                            Color.fromRGBO(244, 246, 250, 0.4),
                                            Color.fromRGBO(213, 218, 229, 0.1),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: ListViewWidget(
                                    imgtpye: disease.key,
                                    type: 'ជំងឺ',
                                    size: size,
                                    itemCount: 5,
                                    imageSize: size.width * 0.35,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
