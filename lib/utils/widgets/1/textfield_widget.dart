import 'package:flutter/material.dart';
import 'package:smart_survey1/assets/theme/palette.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  final title;
  final controller;

  final Icon? icon;

  TextFieldWidget(
      {required Key? key, this.title, this.icon, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 6.0, left: 10, right: 10),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'please add $title';
          } else {
            return null;
          }
        },
        controller: controller,
        onChanged: (val) {},
        decoration: InputDecoration(
          hintText: title,
          prefixIcon: icon,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
        ),
      ),
    );
  }
}
