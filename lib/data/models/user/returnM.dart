// To parse this JSON data, do
//
//     final return = returnFromJson(jsonString);

import 'dart:convert';

Return returnFromJson(String str) => Return.fromJson(json.decode(str));

String returnToJson(Return data) => json.encode(data.toJson());

class Return {
  Return({
    this.guid,
    this.code,
    this.info,
    this.data,
  });

  dynamic guid;
  dynamic code;
  dynamic info;
  dynamic data;

  factory Return.fromJson(Map<String, dynamic> json) => Return(
        guid: json["guid"],
        code: json["code"],
        info: json["info"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "guid": guid,
        "code": code,
        "info": info,
        "data": data,
      };
}
