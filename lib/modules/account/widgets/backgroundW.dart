import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackgroundWidget extends StatelessWidget {
  Widget child;
  BackgroundWidget({required Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 130,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'lib/assets/images/city.jpg',
              ),
            ),
          ),
          Container(
            child: child,
          )
        ],
      ),
    );
  }
}
