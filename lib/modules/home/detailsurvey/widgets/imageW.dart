import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:smart_survey1/data/models/survey/formencode/idatumM.dart';
import 'package:smart_survey1/modules/home/detailsurvey/detailsurveyC.dart';

// ignore: must_be_immutable
class ImageWidget extends StatelessWidget {
  Idatum idatum;

  int index;

  ImageWidget({
    required Key? key,
    required this.idatum,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailSurveyC>(
      builder: (dsc) => SingleChildScrollView(
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
              child: IconButton(
                icon: dsc.temp_fix_array[index].image_path == null
                    ? Image.asset('lib/assets/images/no-image.png')
                    : Image.file(File(dsc.temp_fix_array[index].image_path)),
                iconSize: 100,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: new Icon(Icons.camera),
                            title: new Text('Camera'),
                            onTap: () {
                              getImage(ImageSource.camera, dsc);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.photo),
                            title: new Text('Gallery'),
                            onTap: () {
                              getImage(ImageSource.gallery, dsc);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void getImage(ImageSource imageSource, DetailSurveyC dsc) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      dsc.temp_fix_array[index].image_path = pickedFile.path;
      final bytes = File(pickedFile.path).readAsBytesSync();

      String img64 = base64Encode(bytes);

      dsc.temp_fix_array[index].value = img64;
      dsc.temp_fix_array.refresh();

      // print(dsc.temp_fix_array[index].value.value);
    } else {
      Get.snackbar('error', 'No image Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
