import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_survey1/modules/login/loginC.dart';
import 'package:smart_survey1/modules/login/widgets/buttonW.dart';

import 'package:smart_survey1/utils/widgets/1/password_widget.dart';
import 'package:smart_survey1/utils/widgets/1/textfield_widget.dart';

class BoxFieldWidget extends GetView<LoginC> {
  BoxFieldWidget({required Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 50,
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  child: new Form(
                    key: this.controller.formKey,
                    child: new Column(
                      children: [
                        Container(
                          child: TextFieldWidget(
                            key: key,
                            title: 'Username',
                            icon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            controller: controller.usernameC,
                          ),
                        ),
                        GetBuilder<LoginC>(
                          builder: (loginC) => Container(
                            child: PasswordFieldWidget(
                              controller: loginC.passwordC,
                              showpass: loginC.showpass,
                              onPressed: () {
                                loginC.onShowPassword();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ButtonWidget(
                  press: () {
                    if (controller.isRedundentClick(DateTime.now())) {
                      print('hold on, processing');

                      return;
                    }
                    FocusScope.of(context).requestFocus(new FocusNode());
                    controller.loginUser(
                        controller.usernameC.text, controller.passwordC.text);
                    print('run process');
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
