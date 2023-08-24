import 'dart:convert';

List<GetDisease> postFromJsonDisease(String str) =>
    List<GetDisease>.from(json.decode(str).map((x) => GetDisease.fromJson(x)));

class GetDisease {
  String base64img;
  String message;
  int diseaseid;

  GetDisease(
      {required this.base64img,
      required this.diseaseid,
      required this.message});

  factory GetDisease.fromJson(Map<String, dynamic> json) => GetDisease(
        message: json["message"],
        base64img: json["image_path"],
        diseaseid: json["diseaseid"],
      );
}
