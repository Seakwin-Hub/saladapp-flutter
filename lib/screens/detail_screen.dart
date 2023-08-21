// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:saladapp/models/disease_model.dart';
import 'package:saladapp/models/imagedisease_model.dart';
import 'package:saladapp/models/salad_model.dart';
import 'package:saladapp/resource/assets_route.dart';
import 'package:saladapp/services/api_handler.dart';
import 'package:saladapp/share/widget/bottom_sheet_navigator.dart';
import 'package:saladapp/share/widget/content_widget.dart';
import 'package:saladapp/share/widget/fontcustom_widget.dart';
import 'package:saladapp/share/widget/header_widget.dart';

class DetialScreen extends StatefulWidget {
  int getId;
  String getType;
  DetialScreen({super.key, required this.getId, required this.getType});

  @override
  State<DetialScreen> createState() => _DetialScreenState();
}

class _DetialScreenState extends State<DetialScreen> {
  Salad? salad;
  bool hasimg = false;
  Disease? disease;
  ImageFetch? imageFetch;
  bool isLoading = true;
  @override
  void initState() {
    fetchDataById();
    fetchDataByName();
    super.initState();
  }

  Future<void> fetchDataById() {
    return Future.delayed(
      const Duration(milliseconds: 50),
      () {
        setState(() {
          if (widget.getType == 'សាលាដ') {
            APIHandler.fetchSaladData('saladtype/${widget.getId.toString()}')
                .then((value) {
              for (var i in value) {
                salad = i;
              }
              setState(() {
                isLoading = false;
              });
            });
          } else {
            APIHandler.fetchDiseaseData('disease/${widget.getId.toString()}')
                .then((value) {
              for (var i in value) {
                disease = i;
              }
              setState(() {
                isLoading = false;
              });
            });
          }
        });
      },
    );
  }

  Future<void> fetchDataByName() {
    return Future.delayed(
      const Duration(milliseconds: 100),
      () {
        setState(() {
          if (widget.getType == 'សាលាដ') {
            APIHandler.fetchImageSalad('imagedata/salad/${salad!.other}')
                .then((value) {
              for (var element in value) {
                imageFetch = element;
              }
              setState(() {
                isLoading = false;
                hasimg = true;
              });
            });
          } else {
            APIHandler.fetchImageDisease('imagedata/disease/${disease!.key}')
                .then((value) {
              for (var element in value) {
                imageFetch = element;
              }
              setState(() {
                isLoading = false;
                hasimg = true;
              });
            });
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigatorWidget(
        screen: 7,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(
            title: salad != null
                ? salad!.saladname
                : disease != null
                    ? disease!.disease == 'ផ្សិត'
                        ? 'ជំងឺ${disease!.disease} : ${disease!.typeofdisease}'
                        : 'ជំងឺ${disease!.disease}'
                    : '',
            image: widget.getType == 'សាលាដ'
                ? ImageAssets.logo
                : ImageAssets.virus,
          ),
          SizedBox(
            height: size.height * 0.021,
          ),
          isLoading == true
              ? Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.3, top: size.height * 0.3),
                  child: LottieBuilder.asset(ImageAssets.progressapi,
                      width: size.width * 0.4, fit: BoxFit.contain),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: size.width,
                      child: Column(
                        children: [
                          Text(
                            salad != null
                                ? 'រូបភាព ${salad!.saladname}'
                                : disease != null
                                    ? disease!.disease == 'ផ្សិត'
                                        ? 'រូបភាពជំងឺ${disease!.disease} : ${disease!.typeofdisease}'
                                        : 'រូបភាពជំងឺ${disease!.disease}'
                                    : '',
                            style: customFontBTB(
                                size.width * 0.037, const Color(0xff5F0F0F)),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: size.height * 0.015,
                                bottom: size.height * 0.015,
                                left: size.width * 0.02,
                                right: size.width * 0.02),
                            height: size.height * 0.2,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: imageFetch != null
                                  ? imageFetch!.images.length
                                  : 0,
                              itemBuilder: (context, indexs) {
                                var imageFile = base64Decode(
                                    imageFetch!.images[indexs].toString());
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: size.width * 0.011),
                                  child: SizedBox(
                                    width: size.width * 0.45,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.005,
                                          vertical: size.height * 0.007),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: Colors.blueAccent
                                                  .withOpacity(0.5)),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: hasimg == false
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child: Image.asset(
                                                    ImageAssets.loading,
                                                    width: size.width * 0.03,
                                                    fit: BoxFit.cover),
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child: Image.memory(
                                                  imageFile,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Column(
                            children: [
                              widget.getType == 'សាលាដ' && salad != null
                                  ? Column(
                                      children: [
                                        ContentDetial(
                                          size: size,
                                          title: salad!.saladname,
                                          content: salad!.descrip,
                                          getType: widget.getType,
                                        ),
                                        SizedBox(
                                          height: size.height * 0.07,
                                        ),
                                        ContentDetial(
                                          size: size,
                                          title: '',
                                          content: '',
                                          getType: '',
                                        )
                                      ],
                                    )
                                  : disease != null
                                      ? Column(
                                          children: [
                                            ContentDetial(
                                              size: size,
                                              getType: widget.getType,
                                              title: disease!.disease == 'ផ្សិត'
                                                  ? 'ជំងឺ${disease!.disease} : ${disease!.typeofdisease}'
                                                  : 'ជំងឺ${disease!.disease}',
                                              content:
                                                  '${disease!.dmeaning}  ${disease!.cause}',
                                            ),
                                            ContentDetial(
                                              size: size,
                                              getType: widget.getType,
                                              title:
                                                  'វិធីសាស្រ្តក្នុងការព្យបាល',
                                              content: disease!.treatment,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.07,
                                            ),
                                            ContentDetial(
                                              size: size,
                                              title: '',
                                              content: '',
                                              getType: '',
                                            )
                                          ],
                                        )
                                      : const Text(''),
                            ],
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
