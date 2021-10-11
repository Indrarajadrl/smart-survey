import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordFieldWidget extends StatelessWidget {
  final bool showpass;
  final VoidCallback? onPressed;
  TextEditingController controller;

  PasswordFieldWidget(
      {Key? key,
      required this.showpass,
      required this.onPressed,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 6.0, left: 10, right: 10),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'please add password.';
          } else {
            return null;
          }
        },
        controller: controller,
        obscureText: !showpass,
        onChanged: (val) {},
        onSaved: (val) {},
        decoration: InputDecoration(
          hintText: "Password",
          prefixIcon: Icon(Icons.lock, color: Colors.grey),
          suffixIcon: IconButton(
            icon: Icon(
              showpass ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: onPressed,
          ),
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
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
