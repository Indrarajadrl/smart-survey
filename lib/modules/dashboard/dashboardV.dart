import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_survey1/modules/draft/draftV.dart';
import '../account/accountV.dart';
import '../inbox/inboxV.dart';
import '../home/homeV.dart';
import '../dashboard/dashboardC.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                InboxPage(),
                DraftPage(),
                AccountPage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.red[900],
            onTap: controller.changeTabIndex,
            selectedIconTheme: IconThemeData(size: 23),
            unselectedIconTheme: IconThemeData(size: 20),
            currentIndex: controller.tabIndex,
            selectedFontSize: 14,
            unselectedFontSize: 12,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 8,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.envelope,
                label: 'Inbox',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.doc_on_clipboard,
                label: 'Draft',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.person,
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
