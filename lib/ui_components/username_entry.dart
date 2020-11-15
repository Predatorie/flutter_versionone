import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_versionone/branding.dart';
import 'package:flutter_versionone/controllers/login_controller.dart';
import 'package:get/get.dart';

class UsernameEntry extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
              Icons.person,
              color: mastercamBlack25,
            ),
          ),
          Expanded(
            child: TextFormField(
              style: TextStyle(color: mastercamBlack25),
              controller: controller.usernameController,
              obscureText: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
              validator: (s) => controller.passwordValidator(s),
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(controller.passwordFocus),
              decoration: InputDecoration(
                  filled: false,
                  border: InputBorder.none,
                  hintText: 'Username'),
            ),
          ),
        ],
      ),
    );
  }
}
