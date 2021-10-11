import 'package:flutter/material.dart';

import 'package:smart_survey1/data/models/survey/formencode/idatumM.dart';

import 'package:smart_survey1/modules/home/detailsurvey/detailsurveyC.dart';

class RadiobuttonWidget extends StatelessWidget {
  final label;

  // ignore: non_constant_identifier_names
  final Idatum idatum;
  final DetailSurveyC dsc;

  final index;

  RadiobuttonWidget({
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
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, child) {
            return ListTile(
              title: Text(idatum.option[child].optionlabel),
              leading: Radio<String>(
                onChanged: (val) {
                  if (val != null) {
                    idatum.value = val;

                    // print(idatum.value);

                    FocusScope.of(context).unfocus();
                    dsc.getOption(
                      index,
                      child,
                      idatum.paramsend,
                      idatum.option[child].paramsendank,
                    );

                    dsc.temp_fix_array.refresh();
                    // print(jsonEncode(dsc.temp_fix_array));

                    // checkIsTrue(i, child);
                  }
                },

                groupValue: idatum.value,
                // groupValue: dsc.parentQuestion[i].value.value,
                value: idatum.option[child].paramsendank,
                activeColor: Colors.blue,
              ),
            );
          },
          itemCount: idatum.option.length,
        )
      ],
    );
  }
}
