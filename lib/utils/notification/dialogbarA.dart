import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogbarCustom {
  static dialogError(String msg, String title) {
    Get.defaultDialog(
      title: title,
      middleText: msg,
      radius: 10,
      backgroundColor: Colors.white,
    );
  }

  static dialogSuccess(String title, content) {
    Get.dialog(
      AlertDialog(
        contentPadding:
            EdgeInsets.only(bottom: 10, left: 15, right: 15, top: 15),
        title: Text(title),
        titlePadding: EdgeInsets.only(bottom: 10, left: 15, right: 15, top: 15),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Get.back(closeOverlays: true);
            },
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
