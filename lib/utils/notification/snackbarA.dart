import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarCustom {
  static snackBarSuccess(String msg) {
    Get.showSnackbar(GetBar(
      message: msg,
      icon: Icon(Icons.check_circle, color: Colors.white),
      borderWidth: 20,
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.GROUNDED,
      padding: EdgeInsets.only(bottom: 3),
    ));
  }
}
