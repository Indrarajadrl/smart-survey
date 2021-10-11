import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BgDetailSurveyW extends StatelessWidget {
  BgDetailSurveyW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            height: 280,
            child: new Image.asset(
              'lib/assets/images/checklist.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
