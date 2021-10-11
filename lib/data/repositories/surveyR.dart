import 'dart:async';
import 'dart:convert';
// ignore: unused_import
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_survey1/data/api/surveyP.dart';
import 'package:smart_survey1/data/models/survey/flowencode/flowencodeM.dart';
import 'package:smart_survey1/data/models/survey/flowencode/linkM.dart';
import 'package:smart_survey1/data/models/survey/formencode/formencodeM.dart';
import 'package:smart_survey1/data/models/survey/formencode/idatumM.dart';
import 'package:smart_survey1/data/models/survey/surveydata/datumM.dart';
import 'package:smart_survey1/data/models/survey/surveydata/surveyM.dart';
import 'package:smart_survey1/data/models/user/returnM.dart';
import 'package:smart_survey1/data/models/user/userM.dart';

class SurveyR {
  final SurveyProvider surveyP = SurveyProvider();

//inisalisasi type class dengan return sebuah model
  Future getTokenSurvey() async {
    Map<String, dynamic>? token = await surveyP.getTokenSurvey();

    return token;
  }

//inisalisasi type class dengan return sebuah model
  Future getDataSurvey(dynamic enkriptoken) async {
    var response = await surveyP.getDataSurvey(enkriptoken);
    // PrintJson.printJson(jsonEncode(response));
    if (response != null) {
      var listsurvey = Survey.fromJson(response);

      return listsurvey;
    } else {
      return null;
    }
  }

  Future<List<Idatum>?> getFormEncodeData(datum) async {
    if (datum.formEncode != null) {
      RxList<Idatum> listiddata = <Idatum>[].obs;

      var formencode = FormEncode.fromJson(jsonDecode(datum.formEncode));
      //return sebuah object iddata dan ipoly(value)

      formencode.idata.forEach(
        (element) {
          listiddata.add(element);
        },
      );

      // print(listidatum);
      return listiddata;
    } else {
      return null;
    }
  }

  getFlowEncode(Datum datum) {
    if (datum.flowEncode != null) {
      var flowencode = FlowEncode.fromJson(jsonDecode(datum.flowEncode));

      var maps = flowencode.links;

      List<Link> list = maps.values.toList();

      return list;
    } else {
      return null;
    }
    //return sebuah object iddata dan ipoly(value)

    // print(listidatum);
  }

  //repository return data
  Future<Return?> sendAnswer(RxList<Idatum> answerdata, Datum datum) async {
    /*
    1.data user storage

    */

    var userString = GetStorage('smart-survey').read('datauser');

    Map<String, dynamic> userMap = jsonDecode(userString);

    User user = User.fromJson(userMap);

    // print(user);
    /*
    2.data survey dan idprofile

    */

    Map map2 = {
      "id_profile": datum.idProfile,
      "data": answerdata,
    };

    // log(map2.toString());

    // print(map2);

    var param = json.encode(map2);

    // log(param);

    var info =
        await surveyP.sendAnswer(param, user.data!.token, user.data!.iduser);

    if (info != null) {
      var data = Return.fromJson(info);

      if (data.info != null) {
        return data;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
