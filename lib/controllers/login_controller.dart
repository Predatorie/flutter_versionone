import 'package:flutter/material.dart';
import 'package:flutter_versionone/services/versionone.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final String title = 'LOGIN';

  final VersionOneService api = Get.find();

  TextEditingController usernameController;
  TextEditingController passwordController;
  FocusNode passwordFocus;
  FocusNode buttonFocus;

  @override
  void onReady() {
    usernameController ??= TextEditingController();
    passwordController ??= TextEditingController();
    passwordFocus ??= FocusNode();
    buttonFocus ??= FocusNode();
    super.onReady();
  }

  @override
  void onClose() {
    usernameController?.dispose();
    passwordController?.dispose();
    passwordFocus?.dispose();
    buttonFocus?.dispose();
    super.onClose();
  }

  //Method to handle user sign in using name and password
  signIn(BuildContext context) async {
    var username = usernameController.text;
    var password = passwordController.text;

    print('username: $username password: $password');

    // var member =
    //     await api.login(usernameController.text, passwordController.text);
  }

  String passwordValidator(String s) {
    if (s.isEmpty) {
      return 'Username required.';
    }
    return '';
  }

  String usernameValidator(String s) {
    if (s.isEmpty) {
      return 'Password required.';
    }
    return '';
  }
}
