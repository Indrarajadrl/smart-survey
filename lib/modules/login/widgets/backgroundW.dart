import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_survey1/modules/login/loginC.dart';

// ignore: must_be_immutable
class Background extends GetView<LoginC> {
  Background({
    required Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              padding: EdgeInsets.only(top: 90, left: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-1.0, 0.0),
                  end: Alignment(1.0, 0.0),
                  transform: GradientRotation(0.7853982),
                  colors: [Color(0xff6f0000), Color(0xff200122)],
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            height: 190,
            child: Image.asset(
              'lib/assets/images/telkom2.png',
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
