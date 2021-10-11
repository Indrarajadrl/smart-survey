import 'package:flutter/material.dart';

import 'package:smart_survey1/data/models/survey/formencode/optionM.dart';
import 'package:smart_survey1/modules/home/detailsurvey/detailsurveyC.dart';

// ignore: must_be_immutable
class CheckBoxWidget extends StatelessWidget {
  List<Option> option;

  final label;

  DetailSurveyC dsc;
  int i;

  CheckBoxWidget({
    required Key? key,
    required this.option,
    required this.dsc,
    this.label,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10, left: 10, top: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            dsc.temp_fix_array[i].parentlabel,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: option.length,
          itemBuilder: (context, child) {
            return ListTile(
              title: Text(option[child].optionlabel),
              leading: Checkbox(
                value: checkValue(child),
                activeColor: Colors.green,
                onChanged: (val) {
                  if (val != null) {
                    option[child].value = val;
                    //wajib
                    dsc.temp_fix_array.refresh();
                  }
                },
              ),
            );
          },
        )
      ],
    );
  }

  bool checkValue(child) {
    if (option[child].value == null) {
      option[child].value = false;
    } else if (option[child].value == "false") {
      option[child].value = false;
    } else if (option[child].value == "true") {
      option[child].value = true;
    }
    return option[child].value;
  }
}
