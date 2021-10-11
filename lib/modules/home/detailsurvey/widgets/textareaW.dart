import 'package:flutter/material.dart';

import 'package:smart_survey1/data/models/survey/formencode/idatumM.dart';

// ignore: must_be_immutable
class TextAreaWidget extends StatelessWidget {
  Idatum idatum;
  final keyboardtype;

  TextEditingController? controller;

  TextAreaWidget({
   required this.controller,
    required Key? key,
    required this.idatum,
    this.keyboardtype,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 10, left: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              '${idatum.parentlabel}',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: TextFormField(
              controller: controller,
              onChanged: (val) {
                idatum.value = val;
                // print(idatum.value);
              },
              decoration: InputDecoration(
                hintText: 
                     ' Input description here' + '..',
                hintStyle: idatum.value != null
                    ? TextStyle(fontSize: 14, color: Colors.black)
                    : TextStyle(fontSize: 14, color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
        ],
      ),
    );
  }
}
