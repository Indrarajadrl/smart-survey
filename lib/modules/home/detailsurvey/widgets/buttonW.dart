import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_survey1/modules/home/detailsurvey/detailsurveyC.dart';

class ButtonWidget extends StatelessWidget {
  final dsc = Get.find<DetailSurveyC>();
  final VoidCallback save;
  final VoidCallback draft;
  ButtonWidget({Key? key, required this.save, required this.draft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: -5,
      alignment: WrapAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Material(
            type: MaterialType
                .transparency, //Makes it usable on any background color, thanks @IanSmith
            child: Ink(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.indigoAccent.shade400, width: 1.5),
                color: Colors.lightBlueAccent,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                //This keeps the splash effect within the circle
                borderRadius: BorderRadius.circular(
                    500.0), //Something large to ensure a circle
                onTap: save,
                child: const Padding(
                  padding: EdgeInsets.all(17.0),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
        dsc.isDraft.value != true
            ? Container(
                margin: EdgeInsets.only(top: 10, left: 0),
                child: Material(
                  type: MaterialType
                      .transparency, //Makes it usable on any background color, thanks @IanSmith
                  child: Ink(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 1.5),
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      //This keeps the splash effect within the circle
                      borderRadius: BorderRadius.circular(
                          1000.0), //Something large to ensure a circle
                      onTap: draft,
                      child: Padding(
                        padding: EdgeInsets.all(17.0),
                        child: Text(
                          'Draft',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
