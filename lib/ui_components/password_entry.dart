import 'package:flutter/material.dart';
import 'package:flutter_versionone/branding.dart';
import 'package:flutter_versionone/controllers/login_controller.dart';
import 'package:get/get.dart';

class PasswordEntry extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 6.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: mastercamBlack25, width: 0.5, style: BorderStyle.solid),
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
              color: mastercamBlack25,
            ),
          ),
          Expanded(
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              controller: controller.passwordController,
              obscureText: true,
              focusNode: controller.passwordFocus,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(color: mastercamBlack50),
                hintText: '*********',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
