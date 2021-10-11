import 'package:flutter/cupertino.dart';

import 'optionM.dart';

class Idatum {
  Idatum({
    required this.parenttype,
    required this.parentlabel,
    required this.option,
    required this.paramsend,
    required this.children,
    required this.position,
    required this.xStatus,
    this.value,
    // ignore: non_constant_identifier_names
    this.index_asli,
    // ignore: non_constant_identifier_names
    this.image_path,
  });
  List<Option> option;
  List<dynamic> children;
  dynamic parenttype;
  dynamic parentlabel;
  dynamic paramsend;
  dynamic position;
  dynamic xStatus;
  dynamic child;
  dynamic value;
  // ignore: non_constant_identifier_names
  dynamic index_asli;
  // ignore: non_constant_identifier_names
  dynamic image_path;
  dynamic file;

  factory Idatum.fromJson(Map<String, dynamic> json) => Idatum(
      parenttype: json["parenttype"],
      parentlabel: json["parentlabel"],
      option: List<Option>.from(json["option"].map((x) => Option.fromJson(x))),
      paramsend: json["paramsend"],
      children: List<dynamic>.from(json["children"].map((x) => x)),
      position: json["position"],
      xStatus: json["x_status"],
      value: json["value"],
      index_asli: json["index_asli"],
      image_path: json["image_path"]);

  Map<String, dynamic> toJson() => {
        "parenttype": parenttype,
        "parentlabel": parentlabel,
        "option": List<dynamic>.from(option.map((x) => x.toJson())),
        "paramsend": paramsend,
        "children": List<dynamic>.from(children.map((x) => x)),
        "position": position,
        "x_status": xStatus,
        "child": child,
        "index_asli": index_asli,
        "value": value,
        "image_path": image_path,
      };
}
