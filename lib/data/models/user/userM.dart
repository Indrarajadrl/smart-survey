// get generate model on data/models/user  with lib/json/user.json
//http://survey.khansia.co.id/api/offeneVerschlussel

import 'package:smart_survey1/data/models/user/dataM.dart';

// ignore: must_be_immutable
class User {
  //Constructor is a special method of Dart class which is automatically called when the object is created
  User({
    this.guid,
    this.code,
    this.info,
    required this.data,
  });
  dynamic guid;
  dynamic code; //data json
  dynamic info;
  Data? data;

  //It’s a Map<String, dynamic> It means it maps a String key with a dynamic value data { "key" : value } into a object
  factory User.fromJson(Map<String, dynamic> json) => User(
        guid: json['guid'],
        code: json['code'],
        info: json['info'],
        data: json['data'] != null ? Data.fromJson(json['data'])  : null,
      );

  //A toJson() method, which converts a  instance(object) into a map.
  //create new object
  Map<String, dynamic> toJson() => {
        "guid": guid,
        "code": code,
        "info": info,
        "data": data,
      };
}
