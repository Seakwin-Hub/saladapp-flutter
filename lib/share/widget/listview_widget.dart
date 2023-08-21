import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:saladapp/models/imagedisease_model.dart';
import 'package:saladapp/resource/assets_route.dart';
import 'package:saladapp/services/api_handler.dart';

// ignore: must_be_immutable
class ListViewWidget extends StatefulWidget {
  Size size;
  int itemCount;
  double imageSize;
  String imgtpye, type;
  ListViewWidget({
    super.key,
    required this.type,
    required this.imgtpye,
    required this.size,
    required this.itemCount,
    required this.imageSize,
  });

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  bool hasimg = false;
  ImageFetch? imageFetch;
  List<ImageFetch> getImgDisease = [];
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      setState(() {
        if (widget.imgtpye == 'alldisease') {
          APIHandler.fetchImageDisease('imagedata/disease').then((value) {
            getImgDisease = value;
            if (getImgDisease.isNotEmpty) {
              setState(() {
                hasimg = true;
              });
            }
          });
        }
      });
    });
    Future.delayed(const Duration(milliseconds: 0), () {
      setState(() {
        if (widget.type == 'សាលាដ') {
          APIHandler.fetchImageSalad('imagedata/salad/${widget.imgtpye}')
              .then((value) {
            for (var element in value) {
              imageFetch = element;
            }
            setState(() {
              hasimg = true;
            });
          });
        } else if (widget.type == 'ជំងឺ') {
          APIHandler.fetchImageDisease('imagedata/disease/${widget.imgtpye}')
              .then((value) {
            for (var element in value) {
              imageFetch = element;
            }
            setState(() {
              hasimg = true;
            });
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(imageFetch!.images.length);

    print(getImgDisease.length);
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount:
          imageFetch != null ? imageFetch!.images.length : getImgDisease.length,
      itemBuilder: (context, indexs) {
        var imageFile;
        imageFetch != null
            ? imageFile = base64Decode(imageFetch!.images[indexs].toString())
            : '';

        return Padding(
          padding: EdgeInsets.only(right: widget.size.width * 0.011),
          child: Container(
            width: widget.imageSize,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 127, 180, 94).withOpacity(0.15),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widget.size.width * 0.015,
                  vertical: widget.size.height * 0.007),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: hasimg == false
                    ? Image.asset(ImageAssets.loading,
                        width: widget.size.width * 0.03, fit: BoxFit.cover)
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: imageFile != null
                            ? Image.memory(
                                imageFile,
                                fit: BoxFit.fill,
                              )
                            : getImgDisease.isNotEmpty
                                ? Image.memory(
                                    base64Decode(getImgDisease[indexs]
                                        .images[3]
                                        .toString()),
                                    fit: BoxFit.fill,
                                  )
                                : Image.asset(ImageAssets.loading,
                                    width: widget.size.width * 0.03,
                                    fit: BoxFit.cover),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
