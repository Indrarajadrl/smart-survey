import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_survey1/modules/account/accsetting/accountsetC.dart';
import 'package:smart_survey1/routes/route_name.dart';

class AccsetView extends GetView<AccsetC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Setting',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                padding: EdgeInsets.only(left: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.person_add_rounded,
                    size: 35,
                  ),
                  title: Text(
                    'Profile Account',
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                    Get.toNamed(RouteName.profileacc);
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
                    Icons.password_rounded,
                    size: 35,
                  ),
                  title: Text(
                    'Change Password',
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                    Get.toNamed(RouteName.changepass);
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
                    Icons.person_pin_circle_rounded,
                    size: 35,
                  ),
                  title: Text(
                    'My Address',
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                    Get.toNamed(RouteName.myaddress);
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
                    Icons.logout_rounded,
                    size: 35,
                  ),
                  title: Text(
                    'Log Out',
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                    controller.logout();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
