import 'dart:convert';

List<ImageFetch> postFromJsonImage(String str) =>
    List<ImageFetch>.from(json.decode(str).map((x) => ImageFetch.fromJson(x)));

class ImageFetch {
  String? name;
  List<String> images;

  ImageFetch({
    required this.images,
    required this.name,
  });

  factory ImageFetch.fromJson(Map<String, dynamic> json) => ImageFetch(
        name: json["name"],
        images: json["images"].cast<String>(),
      );
}
