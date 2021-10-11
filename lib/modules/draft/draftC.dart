import 'dart:convert';
// ignore: unused_import
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_survey1/data/models/survey/surveydata/datumM.dart';

import 'package:smart_survey1/data/repositories/surveyR.dart';

class DraftController extends GetxController {
  SurveyR surveyR = Get.find<SurveyR>();

  String title = 'Draft';
  RxBool isInAsyncCall = false.obs;
  RxList<Datum> templistdatum = <Datum>[].obs;

  @override
  void onInit() {
    isInAsyncCall.value = true;
    readDraft();

    super.onInit();
  }

  @override
  void onReady() async {
    templistdatum.refresh();

    print(templistdatum);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void readDraft() {
    if (GetStorage('smart-survey').read('newlistdatum') != null) {
      String templistdatumStr = GetStorage('smart-survey').read('newlistdatum');

      var templistdatumObj2 = List<dynamic>.from(
          jsonDecode(templistdatumStr).map((e) => Datum.fromJson(e)));

      templistdatumObj2.forEach((element) {
        templistdatum.add(element);
      });
    }
    isInAsyncCall.value = false;
  }

  void deleteDraft(Datum datum) {
    templistdatum
        .removeWhere((element) => element.idProfile == datum.idProfile);

    //hapus update data storage

    // list length 2 to length 1 write again
    GetStorage('smart-survey').write('newlistdatum', jsonEncode(templistdatum));
  }

  void addDraft(Datum datum) {
    templistdatum.add(datum);
    //add and then replace
    GetStorage('smart-survey').write('newlistdatum', jsonEncode(templistdatum));
  }
}
