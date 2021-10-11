import 'package:flutter/material.dart';
import 'package:smart_survey1/data/models/survey/formencode/idatumM.dart';

import 'package:smart_survey1/modules/home/detailsurvey/detailsurveyC.dart';

// ignore: must_be_immutable
class DropdownWidget extends StatelessWidget {
  final label;

  // ignore: non_constant_identifier_names
  Idatum idatum;
  DetailSurveyC dsc;

  int index;

  DropdownWidget({
    required Key? key,
    // ignore: non_constant_identifier_names
    required this.idatum,
    required this.index,
    required this.dsc,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10, left: 10, top: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            idatum.parentlabel,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
        ),
        Container(
          width: 350,
          padding: EdgeInsets.only(bottom: 10),
          child: DropdownButtonFormField(
            hint: Text('Pilih ' + idatum.parentlabel),
            value: idatum.value == '' ? null : idatum.value,
            // value: dsc.parentQuestion[i].value,
            dropdownColor: Colors.white,
            items: List.generate(
              idatum.option.length,
              (child) {
                return DropdownMenuItem(
                  child: Text(idatum.option[child].optionlabel),
                  value: idatum.option[child].paramsendank,
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    dsc.getOption(
                      index,
                      child,
                      idatum.paramsend,
                      idatum.option[child].paramsendank,
                    );
                    dsc.temp_fix_array.refresh();
                  },
                );
              },
            ),
            onChanged: (value) {
              // dsc.parentQuestion[i].value.value = value;

              idatum.value = value;
            },
          ),
        )
      ],
    );
  }
}
