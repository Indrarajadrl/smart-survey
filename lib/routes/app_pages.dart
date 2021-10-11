import 'package:get/get.dart';

import './route_name.dart';

import '../modules/home/homeV.dart';

import 'route_index.dart';

/* file untuk management route 
menyimpan nama url contoh : login2 = '/login'
sehingga url tersebut memiliki page LoginView()
*/

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => HomePage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: RouteName.login2,
      page: () => LoginView(),
      binding: LoginB(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: RouteName.initial,
      page: () => InitialView(),
      transition: Transition.fade,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: RouteName.dashboard,
      page: () => DashboardPage(),
      bindings: [
        DashboardBinding(),
      ],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: RouteName.qrcode,
      page: () => QrcodeView(),
    ),
    GetPage(
      name: RouteName.help,
      page: () => HelpView(),
    ),
    GetPage(
      name: RouteName.accset,
      page: () => AccsetView(),
      binding: AccsetB(),
    ),
    GetPage(
      name: RouteName.myaddress,
      page: () => MyadressView(),
    ),
    GetPage(
      name: RouteName.changepass,
      page: () => ChangepassView(),
    ),
    GetPage(
      name: RouteName.myaddress,
      page: () => MyadressView(),
    ),
    GetPage(
      name: RouteName.profileacc,
      page: () => ProfileaccView(),
    ),
    GetPage(
      name: RouteName.detailsurvey,
      page: () => DetailSurveyView(),
      binding: DetailSurveyBinding(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: RouteName.draft,
      page: () => DraftPage(),
      binding: DraftBindings(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200),
    ),
  ];
}
