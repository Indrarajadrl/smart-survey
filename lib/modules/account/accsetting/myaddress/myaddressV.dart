import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_survey1/modules/account/accsetting/myaddress/myaddressC.dart';

class MyadressView extends GetView<MyadressC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Address',
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
