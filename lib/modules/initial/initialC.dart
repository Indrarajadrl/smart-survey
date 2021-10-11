import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_survey1/utils/helper/image_helper.dart';

class InitialC extends GetxController {
  var isSkipIntro = false.obs;
  var code;

  @override
  void onInit() async {
    await ImageHelper.loadImage(AssetImage('lib/assets/images/icon.png'));
    await ImageHelper.loadImage(AssetImage('lib/assets/images/telkom2.png'));

    await ImageHelper.loadImage(AssetImage('lib/assets/images/checklist.jpg'));
    super.onInit();
  }

  Future<void> firstInitialized() async {
    await toLogin().then((value) {
      if (value != null) {
        isSkipIntro.value = true;
      } else if (value == null) {
        isSkipIntro.value = false;
      }
    });
  }

  Future<bool?> toLogin() async {
    //mengambil data dari repository

    code = GetStorage('smart-survey').read('code');

    // print(code);
    if (code == 0) {
      return true;
    } else {
      return null;
    }
  }
}
