import 'package:flutter/material.dart';
import 'package:flutter_versionone/branding.dart';
import 'package:flutter_versionone/controllers/login_controller.dart';
import 'package:flutter_versionone/ui_components/form_vertical_spacing.dart';
import 'package:flutter_versionone/ui_components/logo_graphics_header.dart';
import 'package:flutter_versionone/ui_components/password_entry.dart';
import 'package:flutter_versionone/ui_components/primary_button.dart';
import 'package:flutter_versionone/ui_components/username_entry.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mastercamBlack75,
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
                  UsernameEntry(
                    usernameController: controller.usernameController,
                    passwordFocus: controller.passwordFocus,
                  ),
                  FormVerticalSpace(),
                  PasswordEntry(
                    buttonFocus: controller.buttonFocus,
                    passwordController: controller.passwordController,
                  ),
                  FormVerticalSpace(
                    height: 42,
                  ),
                  PrimaryButton(
                      labelText: 'Sign In',
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          controller.signIn(context);
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
