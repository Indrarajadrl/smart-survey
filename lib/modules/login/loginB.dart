import 'package:get/get.dart';

import 'package:smart_survey1/data/repositories/surveyR.dart';
import 'package:smart_survey1/data/repositories/userR.dart';
import 'package:smart_survey1/modules/login/loginC.dart';
import 'package:smart_survey1/utils/service/networkC.dart';

class LoginB implements Bindings {
  @override
  void dependencies() {
    /*
      ketika menggunakan get.put secara internal memanggil get.find yang dimana
      dependencies akan di load secara segera dan dapat digunakan langsung
      semisalnya controller langsung di binding pada view dalam route
    */
    /*
      permanent : dependecies tidak akan dihapus
      tag : tambahkan tag untuk mengupdate instance secara terpisah pada controller yang sama
    */
    // Get.put<LoginC>(LoginC());
    // Get.put<UserR>(UserR());
    Get.lazyPut<LoginC>(() => LoginC(), fenix: true);
    Get.lazyPut<UserR>(() => UserR(), fenix: true);
    Get.lazyPut<SurveyR>(() => SurveyR(), fenix: true);
    Get.lazyPut<NetworkC>(() => NetworkC(), fenix: true);
  

    //final loginC = Get.find<LoginC>(); simpan pada view untuk menggunakan
  }
}
