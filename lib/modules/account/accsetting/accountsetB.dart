import 'package:get/get.dart';

import 'package:smart_survey1/modules/account/accsetting/accountsetC.dart';

class AccsetB implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccsetC());
  }
}
