import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_survey1/modules/account/accountC.dart';
import 'package:smart_survey1/modules/account/widgets/backgroundW.dart';
import 'package:smart_survey1/modules/account/widgets/boxuserW.dart';
import 'package:smart_survey1/routes/route_name.dart';

class AccountPage extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        key: null,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: BoxUserWidget(key: null,),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 20),
                    padding: EdgeInsets.only(left: 10),
                    child: ListTile(
                      leading: Icon(
                        Icons.qr_code,
                        size: 35,
                      ),
                      title: Text(
                        'My QR Code',
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        Get.toNamed(RouteName.qrcode);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.settings,
                        size: 35,
                      ),
                      title: Text(
                        'Account Setting',
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        Get.toNamed(RouteName.accset);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.help,
                        size: 35,
                      ),
                      title: Text(
                        'Help',
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        Get.toNamed(RouteName.help);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
