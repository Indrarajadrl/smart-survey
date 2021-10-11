// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:smart_survey1/data/models/survey/flowencode/linkM.dart';

import 'operatorM.dart';
import 'operatortype.dart';

FlowEncode flowencodeFromJson(String str) =>
    FlowEncode.fromJson(json.decode(str));

String flowencodeToJson(FlowEncode data) => json.encode(data.toJson());

class FlowEncode {
  FlowEncode({
    required this.operators,
    required this.links,
    required this.operatorTypes,
  });

  Map<String, Operator> operators;
  Map<String, Link> links;
  OperatorTypes operatorTypes;

  factory FlowEncode.fromJson(Map<String, dynamic> json) => FlowEncode(
        operators: Map.from(json["operators"])
            .map((k, v) => MapEntry<String, Operator>(k, Operator.fromJson(v))),
        links: Map.from(json["links"])
            .map((k, v) => MapEntry<String, Link>(k, Link.fromJson(v))),
        operatorTypes: OperatorTypes.fromJson(json["operatorTypes"]),
      );

  Map<String, dynamic> toJson() => {
        "operators": Map.from(operators)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "links": Map.from(links)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "operatorTypes": operatorTypes.toJson(),
      };
}


