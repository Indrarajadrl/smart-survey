import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_survey1/modules/account/accsetting/changepass/changepassC.dart';

class ChangepassView extends GetView<ChangepassC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 60, top: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Password ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 0),
                          padding: EdgeInsets.only(left: 10, right: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'password',
                                icon: Icon(Icons.lock_outline_rounded),
                                suffixIcon: Icon(Icons.visibility_off)),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 60, top: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'New Password ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 0),
                          padding: EdgeInsets.only(left: 10, right: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'password',
                              icon: Icon(Icons.lock_outline_rounded),
                              suffixIcon: Icon(Icons.visibility_off),
                            ),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 60, top: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Re-type Password ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 0),
                          padding: EdgeInsets.only(left: 10, right: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'password',
                              icon: Icon(Icons.lock_outline_rounded),
                              suffixIcon: Icon(Icons.visibility_off),
                            ),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: ClipOval(
                        child: Material(
                          color: Colors.blue, // Button color
                          child: InkWell(
                            splashColor: Colors.red, // Splash color
                            onTap: () {},
                            child: SizedBox(
                                width: 56,
                                height: 56,
                                child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
