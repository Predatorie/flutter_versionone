import 'package:flutter/material.dart';
import 'package:flutter_versionone/branding.dart';
import 'package:flutter_versionone/controllers/login_controller.dart';
import 'package:flutter_versionone/ui_components/form_vertical_spacing.dart';
import 'package:flutter_versionone/ui_components/logo_graphics_header.dart';
import 'package:flutter_versionone/ui_components/password_entry.dart';
import 'package:flutter_versionone/ui_components/username_entry.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: versionOneBackground,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  LogoGraphicHeader(),
                  FormVerticalSpace(),
                  UsernameEntry(),
                  FormVerticalSpace(),
                  PasswordEntry(),
                  FormVerticalSpace(
                    height: 42,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: versionOneRed,
        onPressed: () => controller.signIn(context),
        child: Icon(
          Icons.done,
          size: 32,
          color: Colors.white,
        ),
        splashColor: versionOneBackground,
      ),
    );
  }
}
