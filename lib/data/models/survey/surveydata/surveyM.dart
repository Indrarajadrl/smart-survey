// To parse this JSON data, do
//
//     final survey = surveyFromJson(jsonString);


import 'datumM.dart';


class Survey {
  Survey({
    this.guid,
    this.code,
    required this.info,
    required this.data,
  });

  dynamic guid;
  dynamic code;
  String info;
  List<Datum> data;

  factory Survey.fromJson(Map<String, dynamic> json) => Survey(
        guid: json["guid"],
        code: json["code"],
        info: json["info"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "guid": guid,
        "code": code,
        "info": info,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
