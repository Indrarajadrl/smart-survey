import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_survey1/modules/initial/initialC.dart';
import 'package:smart_survey1/modules/initial/initialV.dart';
import 'package:smart_survey1/modules/login/loginB.dart';
import 'package:smart_survey1/routes/route_name.dart';
import './routes/app_pages.dart';

void main() async {
  await GetStorage.init('smart-survey');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final initialc = Get.put(InitialC());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(
            () => GetMaterialApp(
              title: "Smart Survey",
              initialRoute: initialc.isSkipIntro.isTrue
                  ? RouteName.dashboard
                  : RouteName.login2,
              getPages: AppPages.pages,
              initialBinding: LoginB(),
            ),
          );
        }
        return FutureBuilder(
          future: initialc.firstInitialized(),
          builder: (context, snapshot) => InitialView(),
        );
      },
    );
  }
}
