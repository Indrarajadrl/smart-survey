// To parse this JSON data, do
//
//     final form = formFromJson(jsonString);

import 'dart:convert';

import 'idatumM.dart';

FormEncode formFromJson(String str) => FormEncode.fromJson(json.decode(str));

String formToJson(FormEncode data) => json.encode(data.toJson());

class FormEncode {
  FormEncode({
    required this.idata,
    required this.ipoly,
  });

  List<Idatum> idata;
  dynamic ipoly;

  factory FormEncode.fromJson(Map<String, dynamic> json) => FormEncode(
        idata: List<Idatum>.from(json["idata"].map((x) => Idatum.fromJson(x))),
        ipoly: json["ipoly"],
      );

  Map<String, dynamic> toJson() => {
        "idata": List<dynamic>.from(idata.map((x) => x.toJson())),
        "ipoly": ipoly,
      };
}
