import 'dart:convert';

List<Disease> postFromJsonDisease(String str) =>
    List<Disease>.from(json.decode(str).map((x) => Disease.fromJson(x)));

class Disease {
  String dmeaning;
  String disease;
  String cause;
  String typeofdisease;
  String treatment;
  String key;
  int did;

  Disease(
      {required this.dmeaning,
      required this.disease,
      required this.cause,
      required this.typeofdisease,
      required this.treatment,
      required this.did,
      required this.key});

  factory Disease.fromJson(Map<String, dynamic> json) => Disease(
        dmeaning: json["dmeaning"],
        disease: json["disease"],
        cause: json["cause"],
        key: json["key"],
        typeofdisease: json["typeofdisease"],
        treatment: json["treatment"],
        did: json["did"],
      );
}
