import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_survey1/modules/inbox/inboxC.dart';

class InboxPage extends GetView<InboxController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Inbox Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
