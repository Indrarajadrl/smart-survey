import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_survey1/data/models/survey/surveydata/datumM.dart';
import 'package:smart_survey1/data/repositories/surveyR.dart';

class HomeController extends GetxController {
  RxList<Datum> listsurvey = <Datum>[].obs;
  RxBool isInAsyncCall = false.obs;

  final surveyR = Get.find<SurveyR>();

  String title = 'List Survey';
  var tokensurvey;

  @override
  void onInit() {
    isInAsyncCall.value = true;
    // called immediately after the widget is allocated memory

    // if (listsurvey.length == 0) {
    //   getDataSurvey();
    // }
    //kalau data draftnya tidak kosong , maka tampilkan data draft, jika kosong ambil data dari api
    if (GetStorage('smart-survey').read('listsurveydraft') != null) {
      getDraftSurvey();
    } else {
      getDataSurvey();
    }

    super.onInit();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen

    super.onReady();
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory
    super.onClose();
  }

  getDraftSurvey() {
    String surveyStr = GetStorage('smart-survey').read('listsurveydraft');

    List<dynamic> listSurveyDraft = jsonDecode(surveyStr);
    //one time add
    if (listsurvey.length == 0) {
      for (var i = 0; i < listSurveyDraft.length; i++) {
        listsurvey.add(Datum.fromJson(listSurveyDraft[i]));
        listsurvey.refresh();
      }
    }
    GetStorage('smart-survey').write('listsurveydraft', jsonEncode(listsurvey));

    isInAsyncCall.value = false;
  }

  getDataSurvey() async {
    // print('getdatasurvey');
    /*
      memanggil sebuah fungsi pada class repository yang memparsing parameternya
      lalu mendapatkan value dari class tersebut
    */

    // print(tokensurvey);
    if (GetStorage('smart-survey').read('tokensurvey') != null) {
      await surveyR
          .getDataSurvey(GetStorage('smart-survey').read('tokensurvey'))
          .then((value) {
        //cara mengambil instance value.code/data

        if (value != null) {
          getSurveyOn(value.data);
          isInAsyncCall.value = false;
        } else {
          isInAsyncCall.value = false;
        }
      });
    } else {
      return null;
    }
  }

  getSurveyOn(List<Datum> value) {
    /*
      memanggil sebuah fungsi pada class repository yang memparsing parameternya
      lalu mendapatkan value dari class tersebut
    */
    //check tanggal sekarang
    DateTime now = new DateTime.now();

    // print(now);
    // looping sampai lebar dari data

    for (var i = 0; i < value.length; i++) {
      //membandingkan tanggal sebelumnya dengan tanggal sekarang
      /*
       -1 = telah lewat
        0 = sama
        1 = melebihi
      */

      var start = DateTime.parse(value[i].createDate).compareTo(now);

      var end = DateTime.parse(value[i].endDate).compareTo(now);

      //jika tanggal akhir melebihi tanggal sekarang dan tanggal mulainya lebih kecil dari tanggal sekarang
      if (start <= 0 && end >= 0) {
        if (listsurvey.length == 0) {
          listsurvey.add(value[i]);

          listsurvey.refresh();
          GetStorage('smart-survey')
              .write('listsurveydraft', jsonEncode(listsurvey));
        } else {
          checkDuplicate(value[i]);
        }
      } else if (value[i].masaAktif == "2") {
        checkDuplicate(value[i]);
      }
    }
  }

  //pull to
  checkDuplicate(Datum value) {
    //list    1 2 3 4 5
    //newlist 1 2 3 4 5 6
    //id      6
    //status  true

    if (listsurvey.contains(value)) {
    } else {
      listsurvey.add(value);
      GetStorage('smart-survey')
          .write('listsurveydraft', jsonEncode(listsurvey));

      listsurvey.refresh();
      // print(value.masaAktif);
    }
  }

  deleteDraft() {
    print('hapus data draft');
    //jika storagenya teriisi akan dihapus terlebih dahulu lalu panggil data dari api
    if (GetStorage('smart-survey').read('listsurveydraft') != null) {
      listsurvey.clear();

      GetStorage('smart-survey')
          .write('listsurveydraft', jsonEncode(listsurvey));
    }
  }
}
