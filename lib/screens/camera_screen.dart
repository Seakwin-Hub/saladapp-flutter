import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:saladapp/models/disease_model.dart';
import 'package:saladapp/models/getdisease.dart';
import 'package:saladapp/models/text_data.dart';
import 'package:saladapp/resource/assets_route.dart';
import 'package:saladapp/services/api_handler.dart';
import 'package:saladapp/share/widget/bottom_sheet_navigator.dart';
import 'package:saladapp/share/widget/content_widget.dart';
import 'package:saladapp/share/widget/fontcustom_widget.dart';
import 'package:saladapp/share/widget/header_widget.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String message = '';
  String base64 = '';
  Disease? getDisease;
  List<GetDisease> response = [];
  bool isLoading = false;

  Future<void> uploadimg() async {
    response = await APIHandler.uploadImage(base64);

    Future.delayed(const Duration(milliseconds: 0), () {
      APIHandler.fetchDiseaseData('disease/${response[0].diseaseid.toString()}')
          .then((value) {
        if (value.isNotEmpty) {
          setState(() {
            for (var element in value) {
              getDisease = element;
            }
          });
        }
      });
    });
  }

  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final imagebyte = await pickedFile.readAsBytes();
        setState(() {
          image = pickedFile;
          getimgpath = image!.path;
          base64 = base64Encode(imagebyte);
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void delaysecond() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = true;
      });
    });
  }

  Future<void> pickerCamera() async {
    try {
      // ignore: deprecated_member_use
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        final imagebyte = await pickedFile.readAsBytes();
        setState(() {
          image = pickedFile;
          base64 = base64Encode(imagebyte);
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  String? getimgpath;
  var getBool = false;

  var currentIndex = 0;
  var textData = [
    listTitle,
    instruction,
    btnName,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('>>> $isLoading');
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigatorWidget(
        screen: 3,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(
            title: listTitle[currentIndex],
            image: getBool == false ? ImageAssets.camera : ImageAssets.virus,
          ),
          SizedBox(
            height: size.height * 0.021,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: size.width,
                child: Column(
                  children: [
                    Text(
                      instruction[currentIndex],
                      style: customFontBTB(
                          size.width * 0.037, const Color(0xff5F0F0F)),
                    ),
                    SizedBox(
                      height: size.height * 0.038,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.128),
                      child: SizedBox(
                        width: size.width * 0.744,
                        height: size.height * 0.204,
                        child: getBool == false
                            ? Row(
                                children: [
                                  image != null
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              left: size.width * 0.02),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: size.height * 0.002,
                                                horizontal: size.width * 0.005),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.black12),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.file(
                                                File(image!.path),
                                                width: size.width * 0.40,
                                                height: size.height * 0.7,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Image.asset(
                                          ImageAssets.bgimg,
                                          width: size.width * 0.45,
                                        ),
                                  SizedBox(
                                    width: size.width * 0.025,
                                  ),
                                  Expanded(
                                    child: DottedBorder(
                                      color: const Color(0xffF2DDDD),
                                      borderType: BorderType.RRect,
                                      dashPattern: const [10, 5, 5, 10],
                                      radius: const Radius.circular(10),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.012,
                                            vertical: size.height * 0.005),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: DottedBorder(
                                                color: const Color(0xffF2DDDD),
                                                borderType: BorderType.RRect,
                                                dashPattern: const [
                                                  10,
                                                  5,
                                                  5,
                                                  10
                                                ],
                                                radius:
                                                    const Radius.circular(10),
                                                child: InkWell(
                                                  onTap: () {
                                                    pickerCamera();
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              78,
                                                              229,
                                                              198,
                                                              198),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: browseImage(
                                                        size,
                                                        ImageAssets.takecamera,
                                                        'ថតរូបភាព'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.011,
                                            ),
                                            Expanded(
                                              child: DottedBorder(
                                                color: const Color(0xffF2DDDD),
                                                borderType: BorderType.RRect,
                                                dashPattern: const [
                                                  10,
                                                  5,
                                                  5,
                                                  10
                                                ],
                                                radius:
                                                    const Radius.circular(10),
                                                child: InkWell(
                                                  onTap: () {
                                                    pickImage();
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              78,
                                                              229,
                                                              198,
                                                              198),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: browseImage(
                                                      size,
                                                      ImageAssets.imgbrowse,
                                                      'ជ្រើសរើសរូបភាព',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    color: Colors.amber,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.012,
                                        vertical: size.height * 0.005),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: response.isNotEmpty &&
                                              isLoading == true &&
                                              getBool == true
                                          ? Image.memory(
                                              base64Decode(response[0]
                                                  .base64img
                                                  .toString()),
                                              fit: BoxFit.fill,
                                            )
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: Image.asset(
                                                  ImageAssets.loading,
                                                  width: size.width * 0.03,
                                                  fit: BoxFit.cover),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.038,
                    ),
                    InkWell(
                      onTap: () {
                        bool reload = false;
                        if (image != null) {
                          setState(() {
                            uploadimg();
                            currentIndex += 1;
                            delaysecond();
                            getBool = true;
                            reload = true;
                          });

                          if (currentIndex > 1) {
                            setState(() {
                              image = null;
                              currentIndex = 0;
                              getBool = false;
                            });
                            if (reload) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CameraScreen(),
                                ),
                              );
                            }
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'សូមជ្រើសរើសរូបភាពដើម្បីស្វែងរកជំងឺ',
                                  style: customFontBTB(
                                      size.width * 0.037, Colors.white)),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color(0xffDFEFD3),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.009,
                              horizontal: size.width * 0.105),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              btnName[currentIndex],
                              style: customFontBTB(
                                  size.width * 0.033, const Color(0xff544F4B)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    isLoading && getBool
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: size.height * 0.019,
                              ),
                              Container(
                                width: size.width,
                                height: size.height * 0.016,
                                color: const Color(0xff8E8E8E).withOpacity(0.1),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.07,
                                    vertical: size.height * 0.016),
                                child: Text(
                                  getDisease != null
                                      ? 'ជំងឺដែលបានរកឃើញគឺ ៖ ${getDisease!.disease}'
                                      : '',
                                  style: customFontBTB(size.width * 0.037,
                                      const Color(0xffCF2323)),
                                ),
                              ),
                              ContentDetial(
                                size: size,
                                getType: 'ជំងឺ',
                                title: getDisease!.disease == 'ផ្សិត'
                                    ? 'ជំងឺ${getDisease!.disease} : ${getDisease!.typeofdisease}'
                                    : 'ជំងឺ${getDisease!.disease}',
                                content:
                                    '${getDisease!.dmeaning}  ${getDisease!.cause}',
                              ),
                              ContentDetial(
                                size: size,
                                getType: 'ជំងឺ',
                                title: 'វិធីសាស្រ្តក្នុងការព្យបាល',
                                content: getDisease!.treatment,
                              ),
                            ],
                          )
                        : const Text(''),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column browseImage(Size size, String image, String nameofImg) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.09,
              right: size.width * 0.09,
              top: size.height * 0.015),
          child: Image.asset(
            image,
            width: size.width * 0.05,
          ),
        ),
        Text(
          nameofImg,
          style: customFontBTB(size.width * 0.023, Colors.black),
        ),
      ],
    );
  }
}
