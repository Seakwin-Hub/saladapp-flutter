import 'dart:convert';

List<Salad> postFromJsonDisease(String str) =>
    List<Salad>.from(json.decode(str).map((x) => Salad.fromJson(x)));

class Salad {
  String saladname;
  String descrip;
  String other;
  int sid;

  Salad(
      {required this.saladname,
      required this.descrip,
      required this.sid,
      required this.other});

  factory Salad.fromJson(Map<String, dynamic> json) => Salad(
      sid: json["sid"],
      descrip: json["descrip"],
      saladname: json["saladname"],
      other: json["other"]);
}
