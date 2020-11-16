import 'package:flutter/material.dart';
import 'package:flutter_versionone/branding.dart';
import 'package:flutter_versionone/services/versionone.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final String title = 'LOGIN';

  final VersionOneService api = Get.find();

  TextEditingController usernameController;
  TextEditingController passwordController;
  FocusNode passwordFocus;

  @override
  void onReady() {
    usernameController ??= TextEditingController();
    passwordController ??= TextEditingController();
    passwordFocus ??= FocusNode();
    super.onReady();
  }

  @override
  void onClose() {
    usernameController?.dispose();
    passwordController?.dispose();
    passwordFocus?.dispose();
    super.onClose();
  }

  //Method to handle user sign in using name and password
  signIn(BuildContext context) async {
    var username = usernameController.text;
    var password = passwordController.text;

    /// validating here, validation on entry field not firing as expected.
    if (username.isEmpty) {
      return showMessage('Username required');
    }

    if (password.isEmpty) {
      return showMessage('Password required');
    }

    print('username: $username password: $password');

    var member =
        await api.login(usernameController.text, passwordController.text);
  }

  /// Alert dialog shown for any missing login credentials
  void showMessage(String text) async => await Get.defaultDialog(
      buttonColor: versionOneRed,
      backgroundColor: versionOneBackground,
      confirmTextColor: Colors.white,
      title: 'Sign In',
      titleStyle: TextStyle(color: mastercamBlack25),
      content: Text(
        text,
        style: TextStyle(color: mastercamBlack25),
      ),
      textConfirm: 'OK',
      onConfirm: () => Get.back());
}
