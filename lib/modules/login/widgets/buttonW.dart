import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback press;
  const ButtonWidget({Key? key, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, right: 10, left: 10),
      child: Center(
        child: Container(
          height: 45.0,
          child: ElevatedButton(
            onPressed: press,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(0.0),
            ),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff97251e), Color(0xffbf3033)],
                  ),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                constraints: BoxConstraints(maxWidth: 220.0, minHeight: 30.0),
                alignment: Alignment.center,
                child: Text(
                  "LOG IN",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
