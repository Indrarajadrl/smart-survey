import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_survey1/modules/account/help/helpC.dart';

class HelpView extends GetView<HelpC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
    );
  }
}
