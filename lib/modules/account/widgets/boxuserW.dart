import 'package:flutter/material.dart';

class BoxUserWidget extends StatelessWidget {
  const BoxUserWidget({required Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 15),
                    height: 115,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.0),
                    ),
                    padding: EdgeInsets.all(3),
                    child: CircleAvatar(
                      backgroundColor: Colors.white60,
                      child: Image.asset(
                        'lib/assets/images/no-photo.jpg',
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  '',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            
            ],
          ),
        ],
      ),
    );
  }
}
