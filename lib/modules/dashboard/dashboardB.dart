import 'package:get/get.dart';
import 'package:smart_survey1/data/api/surveyP.dart';

import 'package:smart_survey1/data/repositories/surveyR.dart';
import 'package:smart_survey1/modules/draft/draftC.dart';
import 'package:smart_survey1/modules/inbox/inboxC.dart';
import 'package:smart_survey1/utils/service/networkC.dart';

import '../account/accountC.dart';
import '../dashboard/dashboardC.dart';
import '../home/homeC.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<InboxController>(() => InboxController());
    // different instances for different list items

    Get.put(DraftController());
    Get.put(() => NetworkC(), permanent: true);
    Get.put(() => SurveyR());

    Get.lazyPut<SurveyProvider>(() => SurveyProvider());
  }
}
