import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:saladapp/models/imagedisease_model.dart';
import 'package:saladapp/resource/assets_route.dart';
import 'package:saladapp/services/api_handler.dart';
import 'package:saladapp/share/widget/bottom_sheet_navigator.dart';
import 'package:saladapp/share/widget/header_widget.dart';

class FetchAPI extends StatefulWidget {
  const FetchAPI({super.key});

  @override
  State<FetchAPI> createState() => _FetchAPIState();
}

class _FetchAPIState extends State<FetchAPI> {
  bool isLoading = false;
  List<ImageFetch> imageData = [];
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        APIHandler.fetchImageSalad('imagedata/salad/iceberg').then((value) {
          // imageData = value;
          setState(() {
            isLoading = true;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigatorWidget(
        screen: 7,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(
            title: "Fetch API",
            image: ImageAssets.virus,
          ),
          isLoading == false
              ? const Text('Waiting')
              : Expanded(
                  child: ListView.builder(
                    itemCount: imageData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.memory(
                            base64Decode(imageData[index].images[1].toString()),
                            fit: BoxFit.contain,
                            scale: 3,
                          ),
                        ),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
