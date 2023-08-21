import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saladapp/models/text_data.dart';
import 'package:saladapp/resource/assets_route.dart';
import 'package:saladapp/share/widget/bottom_sheet_navigator.dart';
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

  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          image = pickedFile;
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> pickerCamera() async {
    try {
      // ignore: deprecated_member_use
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      setState(() {
        if (pickedFile != null) {
          image = pickedFile;
        }
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  var getBool = false;

  var currentIndex = 0;
  var textData = [
    listTitle,
    instruction,
    btnName,
  ];
  @override
  Widget build(BuildContext context) {
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
                                    horizontal: size.width * 0.116),
                                child: Container(
                                  color: Colors.amber,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.012,
                                      vertical: size.height * 0.005),
                                  child: Image.file(
                                    File(image!.path),
                                    fit: BoxFit.fill,
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
                        if (image != null) {
                          setState(() {
                            currentIndex += 1;
                          });
                          getBool = true;

                          if (currentIndex > 1) {
                            setState(() {
                              image = null;
                              currentIndex = 0;
                            });
                            getBool = false;
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
                    getBool == true
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
                                  'ជំងឺដែលបានរកឃើញគឺ ៖ បាក់តេរី',
                                  style: customFontBTB(size.width * 0.037,
                                      const Color(0xffCF2323)),
                                ),
                              ),
                              // ContentDetial(
                              //   size: size,
                              // ),
                              // ContentDetial(
                              //   size: size,
                              // ),
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
