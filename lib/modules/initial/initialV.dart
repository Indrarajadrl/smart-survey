import 'package:flutter/material.dart';

class InitialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            child: Image.asset(
              'lib/assets/images/icon.png',
            ),
          ),
        ),
      ),
    );
  }
}
