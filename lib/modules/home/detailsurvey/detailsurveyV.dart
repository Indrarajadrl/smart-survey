import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:smart_survey1/modules/home/detailsurvey/detailsurveyC.dart';
import 'package:smart_survey1/modules/home/detailsurvey/widgets/backgroundW.dart';
import 'package:smart_survey1/modules/home/detailsurvey/widgets/buttonW.dart';
import 'package:smart_survey1/modules/home/detailsurvey/widgets/checkboxW.dart';
import 'package:smart_survey1/modules/home/detailsurvey/widgets/dropdownW.dart';
import 'package:smart_survey1/modules/home/detailsurvey/widgets/fileW.dart';
import 'package:smart_survey1/modules/home/detailsurvey/widgets/imageW.dart';
import 'package:smart_survey1/modules/home/detailsurvey/widgets/mapW.dart';
import 'package:smart_survey1/modules/home/detailsurvey/widgets/radiobuttonW.dart';
import 'package:smart_survey1/modules/home/detailsurvey/widgets/textareaW.dart';
import 'package:smart_survey1/modules/home/detailsurvey/widgets/textfieldW.dart';

class DetailSurveyView extends StatelessWidget {
  final dsc = Get.find<DetailSurveyC>();

  //dsc = detail survey controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('${dsc.getarguments[0].judul}',
                style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black)),
        body: Obx(
          () => ModalProgressHUD(
            inAsyncCall: dsc.isInAsyncCall.value,
            progressIndicator:
                Center(child: SpinKitRing(color: Colors.blue.shade200)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  dsc.isDraft.value == false
                      ? Container(child: BgDetailSurveyW())
                      : Container(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        listDetailSurvey(),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: ButtonWidget(
                            save: () {
                              dsc.submitAnswer('save');
                              FocusScope.of(context).unfocus();
                            },
                            draft: () {
                              dsc.submitAnswer('draft');

                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  listDetailSurvey() {
    return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Obx(() => ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: dsc.temp_fix_array.length,
            itemBuilder: (context, i) {
              return Column(children: [
                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(children: <Widget>[
                      checkParentType(i),
                    ]))
              ]);
            })));
  }

  checkParentType(i) {
    //textfield
    if (dsc.temp_fix_array[i].parenttype == "1") {
      return TextFieldWidget(
        key: key,
        idatum: dsc.temp_fix_array[i],
        controller: TextEditingController(text: dsc.temp_fix_array[i].value),
      );
      //textarea
    } else if (dsc.temp_fix_array[i].parenttype == "2") {
      //dropdown
      return TextAreaWidget(
          key: key,
          idatum: dsc.temp_fix_array[i],
          controller: TextEditingController(text: dsc.temp_fix_array[i].value));
    } else if (dsc.temp_fix_array[i].parenttype == "3") {
      return DropdownWidget(
          key: key, idatum: dsc.temp_fix_array[i], index: i, dsc: dsc);
      //radio button
    } else if (dsc.temp_fix_array[i].parenttype == "4") {
      return RadiobuttonWidget(
          key: key, idatum: dsc.temp_fix_array[i], index: i, dsc: dsc);
      //checkbox
    } else if (dsc.temp_fix_array[i].parenttype == "5") {
      return CheckBoxWidget(
          key: key, i: i, option: dsc.temp_fix_array[i].option, dsc: dsc);
      //image
    } else if (dsc.temp_fix_array[i].parenttype == "12") {
      return ImageWidget(key: key, idatum: dsc.temp_fix_array[i], index: i);
      //map
    } else if (dsc.temp_fix_array[i].parenttype == "11") {
      return MapWidget(
          key: key, idatum: dsc.temp_fix_array[i], dsc: dsc, index: i);
      //file
    } else if (dsc.temp_fix_array[i].parenttype == "6") {
      return FileWidget(
          key: key, idatum: dsc.temp_fix_array[i], dsc: dsc, index: i);
    } else {
      return Container();
    }
  }
}
