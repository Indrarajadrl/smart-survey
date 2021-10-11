import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:smart_survey1/data/models/survey/formencode/idatumM.dart';
import 'package:smart_survey1/modules/home/detailsurvey/detailsurveyC.dart';

// ignore: must_be_immutable
class FileWidget extends StatelessWidget {
  Idatum idatum;

  DetailSurveyC dsc;

  int index;

  FileWidget({
    required Key? key,
    required this.idatum,
    required this.dsc,
    required this.index,
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
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 10, left: 10),
            child: Material(
              type: MaterialType
                  .transparency, //Makes it usable on any background color, thanks @IanSmith
              child: Ink(
                decoration:
                    DottedDecoration(color: Colors.grey, shape: Shape.box),
                child: InkWell(
                  //This keeps the splash effect within the circle
                  borderRadius: BorderRadius.circular(
                      500.0), //Something large to ensure a circle
                  onTap: () {
                    getFile();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(17.0),
                    child: Icon(
                      Icons.upload,
                      color: Colors.grey,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else {
      // User canceled the picker
    }
  }
}
