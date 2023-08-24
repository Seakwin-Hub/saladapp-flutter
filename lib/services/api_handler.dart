// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:saladapp/models/disease_model.dart';
import 'package:saladapp/models/getdisease.dart';
import 'package:saladapp/models/imagedisease_model.dart';
import 'package:saladapp/models/salad_model.dart';
import 'package:saladapp/resource/api_const.dart';

String apiHandleError = 'Problem with API';

class APIHandler {
  static Future<List<GetDisease>> uploadImage(String base64) async {
    // try {
    if (base64.isNotEmpty) {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:5000/imageupload'),
        body: jsonEncode({'image': base64}),
        headers: {'Content-Type': 'application/json'},
      );
      final parsed = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Image uploaded successfully');
        var getDisease = (parsed['objresponse'] as List)
            .map((itemdisease) => GetDisease.fromJson(itemdisease))
            .toList();
        return getDisease;
      } else {
        throw Exception(apiHandleError);
      }
    }
    // } catch (e) {
    //   print(e);
    // }
    return [];
  }

  static Future<List<ImageFetch>> fetchImageSalad(String typeimg) async {
    var uri = Uri.http(baseURL, typeimg);
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        var image = (parsed['saladtypeimg'] as List)
            .map((itemdisease) => ImageFetch.fromJson(itemdisease))
            .toList();
        print("Salad Image Fetch Success");
        return image;
      } else {
        throw Exception(apiHandleError);
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  static Future<List<ImageFetch>> fetchImageDisease(String typeimg) async {
    var uri = Uri.http(baseURL, typeimg);
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        var image = (parsed['diseasetypeimg'] as List)
            .map((itemdisease) => ImageFetch.fromJson(itemdisease))
            .toList();
        print("Disease Image Fetch Success");
        return image;
      } else {
        throw Exception(apiHandleError);
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  static Future<List<Salad>> fetchSaladData(String apiCallBy) async {
    var uri = Uri.http(baseURL, apiCallBy);
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        var salad = (parsed['saladtype'] as List)
            .map((itemdisease) => Salad.fromJson(itemdisease))
            .toList();
        print('>>>>> $response Salad API Fetch success');
        return salad;
      } else {
        throw Exception(apiHandleError);
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  static Future<List<Disease>> fetchDiseaseData(String apiCallBy) async {
    var uri = Uri.http(baseURL, apiCallBy);
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        print('>>>>> $response disease API Fetch success');
        final parsed = jsonDecode(response.body);
        var diseases = (parsed['disease'] as List)
            .map((itemdisease) => Disease.fromJson(itemdisease))
            .toList();
        return diseases;
      } else {
        throw Exception(apiHandleError);
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}
