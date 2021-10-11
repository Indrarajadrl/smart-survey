import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccsetC extends GetxController {
  final box = GetStorage('smart-survey');
  void logout() {
    box.erase();
    Get.offAllNamed("/login2");
  }
}
