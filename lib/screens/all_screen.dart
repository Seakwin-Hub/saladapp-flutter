// ignore_for_file: avoid_print, dead_code, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:saladapp/models/disease_model.dart';
import 'package:saladapp/models/imagedisease_model.dart';
import 'package:saladapp/models/salad_model.dart';
import 'package:saladapp/resource/assets_route.dart';
import 'package:saladapp/screens/detail_screen.dart';
import 'package:saladapp/screens/disease_screen.dart';
import 'package:saladapp/screens/salad_screen.dart';
import 'package:saladapp/services/api_handler.dart';
import 'package:saladapp/share/widget/bottom_sheet_navigator.dart';
import 'package:saladapp/share/widget/fontcustom_widget.dart';
import 'package:saladapp/share/widget/header_widget.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  bool isLoading1 = false,
      isLoading2 = false,
      isLoading3 = false,
      isLoading4 = false,
      hasimg = false;
  List<Disease> diseaseList = [];
  List<Salad> saladList = [];
  List<ImageFetch> getImgSalad = [];
  List<ImageFetch> getImgDisease = [];
  List<dynamic> combineList = [];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        APIHandler.fetchSaladData('saladlist').then((value) {
          saladList = value;
          combineList.addAll(saladList);
          setState(() {
            isLoading1 = true;
          });
        });
      });
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        APIHandler.fetchDiseaseData('diseaselist').then((value) {
          diseaseList = value;
          combineList.addAll(diseaseList);
          setState(() {
            isLoading2 = true;
          });
        });
      });
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        APIHandler.fetchImageSalad('imagedata/salad').then((value) {
          getImgSalad = value;
          setState(() {
            isLoading3 = true;
          });
        });
      });
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        APIHandler.fetchImageDisease('imagedata/disease').then((value) {
          getImgDisease = value;
          setState(() {
            isLoading4 = true;
          });
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> nameOfSD = ['សាលាដ', 'ជំងឺ'];
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigatorWidget(
        screen: 1,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(
            title: "សូមស្វាគមន៍មកកាន់សាលាដឃែរ",
            image: ImageAssets.famer,
          ),
          SizedBox(
            height: size.height * 0.021,
          ),
          isLoading1 == false &&
                  isLoading2 == false &&
                  isLoading3 == false &&
                  isLoading4 == false
              ? Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.3, top: size.height * 0.3),
                  child: LottieBuilder.asset(ImageAssets.progressapi,
                      width: size.width * 0.4, fit: BoxFit.contain),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.047),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'សាលាដ និង ជំងឺ',
                            style: customFontBTB(
                                size.width * 0.047, const Color(0xff00677F)),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          SizedBox(
                            height: size.height * 0.165,
                            child: ListView.builder(
                                itemCount: combineList.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, indexs) {
                                  var saladItem = combineList[indexs];
                                  var getType, imagefile;

                                  if (indexs < saladList.length) {
                                    for (var element in getImgSalad) {
                                      if (saladItem.other == element.name) {
                                        hasimg = true;
                                        imagefile = base64Decode(
                                            element.images[6].toString());
                                      }
                                    }
                                  } else {
                                    for (var element in getImgDisease) {
                                      if (saladItem.key
                                              .toString()
                                              .toLowerCase() ==
                                          element.name!.toLowerCase()) {
                                        hasimg = true;
                                        imagefile = base64Decode(
                                            element.images[3].toString());
                                      }
                                    }
                                  }

                                  if (indexs < saladList.length) {
                                    getType = nameOfSD[0];
                                  } else {
                                    getType = nameOfSD[1];
                                  }
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetialScreen(
                                                getType: getType,
                                                getId: getType == 'សាលាដ'
                                                    ? saladItem.sid
                                                    : saladItem.did)),
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.007,
                                          vertical: size.height * 0.003),
                                      child: Container(
                                        width: size.width * 0.35,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              spreadRadius: -4,
                                              blurRadius: 10,
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.012,
                                              vertical: size.height * 0.005),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: size.height * 0.11,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: hasimg == false
                                                    ? Image.asset(
                                                        ImageAssets.loading,
                                                        width: size.width * 0.4,
                                                        fit: BoxFit.contain)

                                                    // ? FadeInImage.assetNetwork(
                                                    //     fit: BoxFit.cover,
                                                    //     placeholder:
                                                    //         ImageAssets.loading,
                                                    //     image: '',
                                                    //     // imageErrorBuilder:
                                                    //     //     (context, error,
                                                    //     //         stackTrace) {
                                                    //     //   return const Icon(
                                                    //     //     Icons
                                                    //     //         .image_not_supported_rounded,
                                                    //     //     color: Colors.red,
                                                    //     //   );
                                                    //     // },
                                                    //   )
                                                    : ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: Image.memory(
                                                          imagefile,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: size.width,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          size.width * 0.012,
                                                      vertical:
                                                          size.height * 0.005),
                                                  decoration: BoxDecoration(
                                                      gradient:
                                                          const LinearGradient(
                                                              colors: [
                                                            Color.fromRGBO(136,
                                                                157, 232, 0.54),
                                                            Color.fromRGBO(
                                                                15, 3, 18, 0.1),
                                                          ],
                                                              begin: Alignment
                                                                  .topLeft,
                                                              end: Alignment
                                                                  .bottomRight),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    indexs < saladList.length
                                                        ? saladItem.saladname
                                                        : saladItem.disease ==
                                                                'ផ្សិត'
                                                            ? 'ជំងឺ : ${saladItem.typeofdisease}'
                                                            : 'ជំងឺ : ${saladItem.disease}',
                                                    textAlign: TextAlign.center,
                                                    style: customFontKangrey(
                                                        size.width * 0.028,
                                                        Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemCount: nameOfSD.length,
                            itemBuilder: (context, indexs) {
                              var getType = nameOfSD[indexs];
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        getType,
                                        style: customFontBTB(size.width * 0.047,
                                            const Color(0xff00677F)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  getType == 'សាលាដ'
                                                      ? const SaladScreen()
                                                      : const DiseaseScreen(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'មើលទាំងអស់',
                                          style: customFontKoulen(
                                              size.width * 0.037,
                                              const Color(0xff00677F)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ListView.builder(
                                      padding: const EdgeInsets.all(0),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: getType == 'សាលាដ'
                                          ? saladList.length
                                          : diseaseList.length,
                                      itemBuilder: (context, index) {
                                        var getItem, imageFile;
                                        if (getType == 'សាលាដ') {
                                          getItem = saladList[index];
                                          for (var element in getImgSalad) {
                                            if (getItem.other == element.name) {
                                              hasimg = true;
                                              imageFile = base64Decode(
                                                  element.images[3].toString());
                                            }
                                          }
                                        } else {
                                          getItem = diseaseList[index];
                                          for (var element in getImgDisease) {
                                            if (getItem.key == element.name) {
                                              hasimg = true;
                                              imageFile = base64Decode(
                                                  element.images[0].toString());
                                            }
                                          }
                                        }

                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: size.height * 0.011),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 2,
                                                    offset: const Offset(2, 3),
                                                    color: const Color.fromARGB(
                                                            255, 194, 161, 161)
                                                        .withOpacity(0.2))
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: const LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(
                                                      227, 229, 224, 1),
                                                  Color.fromRGBO(
                                                      248, 248, 252, 0.2),
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                            ),
                                            child: IntrinsicHeight(
                                              child: Row(children: [
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical:
                                                          size.height * 0.005,
                                                      horizontal:
                                                          size.width * 0.012),
                                                  width: size.width * 0.3,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 218, 208, 208),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: hasimg == false
                                                      ? Image.asset(
                                                          ImageAssets.loading,
                                                          width:
                                                              size.width * 0.03,
                                                          fit: BoxFit.cover)
                                                      : ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          child: Image.memory(
                                                            imageFile,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      getType == 'សាលាដ'
                                                          ? getItem.saladname
                                                          : getItem.disease ==
                                                                  'ផ្សិត'
                                                              ? 'ជំងឺ ${getItem.disease} : ${getItem.typeofdisease}'
                                                              : 'ជំងឺ ${getItem.disease}',
                                                      style: customFontKoulen(
                                                          size.width * 0.037,
                                                          const Color(
                                                              0xff403759)),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          size.height * 0.005,
                                                    ),
                                                    Text(
                                                      getType == 'សាលាដ'
                                                          ? getItem.descrip
                                                          : getItem.dmeaning,
                                                      style: customFontBTB(
                                                          size.width * 0.028,
                                                          Colors.black),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      softWrap: true,
                                                      maxLines: 2,
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          size.height * 0.016,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => DetialScreen(
                                                                  getType:
                                                                      getType,
                                                                  getId: getType ==
                                                                          'សាលាដ'
                                                                      ? getItem
                                                                          .sid
                                                                      : getItem
                                                                          .did)),
                                                        );
                                                      },
                                                      child: Align(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              right:
                                                                  size.width *
                                                                      0.033,
                                                              bottom:
                                                                  size.height *
                                                                      0.008),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      size.width *
                                                                          0.063,
                                                                  vertical: size
                                                                          .height *
                                                                      0.002),
                                                          decoration:
                                                              const BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            5),
                                                                  ),
                                                                  color: Color(
                                                                      0xffF7E467)),
                                                          child: Text(
                                                              'អានបន្ថែម',
                                                              style: customFontKoulen(
                                                                  size.width *
                                                                      0.028,
                                                                  const Color(
                                                                      0xff404040))),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ))
                                              ]),
                                            ),
                                          ),
                                        );
                                      }),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
