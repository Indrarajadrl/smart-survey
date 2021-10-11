import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:smart_survey1/data/repositories/surveyR.dart';
import 'package:smart_survey1/data/repositories/userR.dart';
import 'package:smart_survey1/utils/notification/dialogbarA.dart';
import 'package:smart_survey1/utils/notification/snackbarA.dart';
import 'package:smart_survey1/utils/service/networkC.dart';

class LoginC extends GetxController {
  final userR = Get.find<UserR>();
  final surveyR = Get.find<SurveyR>();
  final networkC = Get.find<NetworkC>();
  final formKey = GlobalKey<FormState>();

  //create object

  final TextEditingController usernameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  RxBool isInAsyncCall = false.obs;

  bool showpass = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  onShowPassword() {
    showpass = !showpass;
    update();
  }

  /*
    tipe void tidak menghasilkan sebuah return value pada class
  */
  loginUser(usernameC, passwordC) async {
    /*
      memanggil sebuah fungsi pada class repository yang memparsing parameternya
      lalu mendapatkan value dari class tersebut
    */
    print(networkC.statusConnection.value);
    if (networkC.statusConnection.value == 'ONLINE') {
      if (formKey.currentState!.validate()) {
        isInAsyncCall.value = true;

        await userR.getToken(usernameC, passwordC).then((enkrip) {
          getUserData(enkrip);
        }).catchError(
          (err) {
            return null;
          },
        );
      }
    } else {
      DialogbarCustom.dialogError('No Internet Founded.', 'Failed');
    }
  }

  void getUserData(String enkrip) async {
    await userR.getUser(enkrip).then((value) {
      if (value != null) {
        print(value.info);
        if (value.code == 0) {
          GetStorage('smart-survey').write('code', value.code);

          GetStorage('smart-survey').write('datauser', jsonEncode(value));

          getTokenSurvey();
        } else if (value.info == "Incoorrect Username or Password.") {
          isInAsyncCall.value = false;
          passwordC.text = "";
          DialogbarCustom.dialogError(value.info, 'invalid');
        } else if (value.info == "Failed # Decrypt Object") {
          isInAsyncCall.value = false;
          DialogbarCustom.dialogError(value.info, 'invalid');
        }
      } else {
        isInAsyncCall.value = false;
        DialogbarCustom.dialogError('No connection to server', 'Failed');
      }
    }).timeout(Duration(seconds: 5), onTimeout: () {
      //setelah await melebihi 5 detik return timeout
      isInAsyncCall.value = false;
      // DialogbarCustom.dialogError('Request Time Out', 'Failed');
    });
  }

  void getTokenSurvey() async {
    await surveyR.getTokenSurvey().then((value) {
      GetStorage('smart-survey').write('tokensurvey', jsonEncode(value));
      isInAsyncCall.value = false;
      Get.offAndToNamed('/dashboard');
      SnackbarCustom.snackBarSuccess('login berhasil');
    });
  }

  DateTime? loginClickTime;

  bool isRedundentClick(DateTime currentTime) {
    if (loginClickTime == null) {
      loginClickTime = currentTime;

      return false;
    }
    // print('diff is ${currentTime.difference(loginClickTime!).inSeconds}');
    if (currentTime.difference(loginClickTime!).inSeconds < 1) {
      //set this difference time in seconds

      return true;
    }

    loginClickTime = currentTime;
    return false;
  }
}
