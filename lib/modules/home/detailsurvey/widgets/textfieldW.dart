import 'package:flutter/material.dart';

import 'package:smart_survey1/data/models/survey/formencode/idatumM.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  Idatum idatum;

  TextEditingController? controller;

  TextFieldWidget({
    this.controller,
    required Key? key,
    required this.idatum,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '${idatum.parentlabel}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blueGrey),
              )),
          Container(
            padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
            child: TextFormField(
              onChanged: (val) {
                idatum.value = val;
              },
              controller: controller,
              decoration: InputDecoration(
                  hintText: ' Input ' + idatum.parentlabel + '..',
                  hintStyle: idatum.value != null
                      ? TextStyle(fontSize: 14, color: Colors.black)
                      : TextStyle(fontSize: 14, color: Colors.grey)),
              keyboardType: idatum.parentlabel.toString().contains("No")
                  ? TextInputType.number
                  : idatum.parentlabel.toString().contains("NIK") ||
                          idatum.parentlabel.toString().contains("Nik")
                      ? TextInputType.number
                      : TextInputType.text,
            ),
          ),
        ],
      ),
    );
  }
}
