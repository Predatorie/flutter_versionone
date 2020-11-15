import 'package:flutter/material.dart';
import 'package:flutter_versionone/branding.dart';
import 'package:flutter_versionone/controllers/login_controller.dart';
import 'package:get/get.dart';

class PasswordEntry extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    final obscure = true.obs;

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 6.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: versionOneRed, width: 0.5, style: BorderStyle.solid),
        ),
      ),
      padding: EdgeInsets.only(left: 0.0, right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
            child: Icon(
              Icons.lock_open,
              color: versionOneRed,
            ),
          ),
          Expanded(
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              controller: controller.passwordController,
              obscureText: obscure.value,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.center,
              validator: (s) => controller.passwordValidator(s),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '*********',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
            child: InkWell(
              onTap: () {
                obscure.toggle();
                obscure.refresh();
                print(obscure.value);
              },
              child: Icon(
                Icons.remove_red_eye,
                color: versionOneRed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
