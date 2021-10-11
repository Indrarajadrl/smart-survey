// ignore: unused_import
import 'dart:developer';

import 'package:get/get.dart';

class SurveyProvider extends GetConnect {
  Future<Map<String, dynamic>?> getTokenSurvey() async {
    /*
      body form data
    */
    const endpoint = '/auftragsProfil';

    //post data
    var response = await post(
      'http://survey.khansia.co.id/api' + endpoint,
      {},
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('failed connection');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getDataSurvey(dynamic enkriptoken) async {
    const endpoint = '/offeneVerschlussel';
    /*
      body form data
    */

    final body = FormData({
      'entrez': enkriptoken,
    });

    //post data
    var response = await post(
      'http://survey.khansia.co.id/api' + endpoint,
      body,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('failed connection' + endpoint);
      return null;
    }
  }

  sendAnswer(param, guid, iduser) async {
    const endpoint = "/insererUneEnquete";

    // print(guid);
    // log(param);
    final body = FormData({
      'iparam': param,
      'guid': guid,
      'iduser': iduser,
    });

    var response = await post(
      'http://survey.khansia.co.id/api' + endpoint,
      body,
    );

    if (response.statusCode == 200) {
      // print(response.body);
      return response.body;
    } else {
      print('failed connection' + endpoint);
      return null;
    }
  }
}
