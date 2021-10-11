import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:smart_survey1/modules/login/loginC.dart';
import 'package:smart_survey1/modules/login/widgets/backgroundW.dart';
import 'package:smart_survey1/modules/login/widgets/boxfieldW.dart';

class LoginView extends GetView<LoginC> {
  /*
    get.find sebuah method untuk dependecy injection
    ketika suatu view itu membutuhkan controller sehingga dapat digunakan data/fungsi
  */

  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ModalProgressHUD(
          inAsyncCall: controller.isInAsyncCall.value,
          progressIndicator: Center(
            child: SpinKitFoldingCube(
              color: Colors.white,
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Background(
                        key: null,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 200,
                        ),
                        child: BoxFieldWidget(
                          key: null,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
