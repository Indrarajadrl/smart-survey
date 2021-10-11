import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_survey1/modules/draft/draftC.dart';

class Logout extends GetxController {
  final box = GetStorage('smart-survey');
  final dfc = Get.find<DraftController>();
  void logout() {
    box.remove('newlistdatum');
    box.remove('code');
    box.remove('datauser');
    dfc.templistdatum.clear();
    box.remove('listsurveydraft');

    Get.offAllNamed("/login2");
  }
}
