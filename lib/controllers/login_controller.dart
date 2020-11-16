import 'package:flutter/material.dart';
import 'package:flutter_versionone/models/members.dart';
import 'package:flutter_versionone/models/result.dart';
import 'package:flutter_versionone/services/versionone.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  /// resolve our version one api service
  final VersionOneService api = Get.find();

  TextEditingController usernameController;
  TextEditingController passwordController;
  FocusNode passwordFocus;

  @override
  void onReady() {
    usernameController ??= TextEditingController();
    usernameController.text = '';

    passwordController ??= TextEditingController();
    passwordController.text = '';

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
  Future<Result<Member>> signIn(BuildContext context) async {
    var username = usernameController.text;
    var password = passwordController.text;

    /// validating here, validation on entry field not firing as expected.
    if (username.isEmpty) {
      return Result<Member>(
        success: false,
        value: null,
        errorMessage: 'Username required',
      );
    }

    if (password.isEmpty) {
      return Result<Member>(
        success: false,
        value: null,
        errorMessage: 'Password required',
      );
    }

    try {
      var member =
          await api.login(usernameController.text, passwordController.text);

      if (member != null) {
        return Result<Member>(
          value: member,
          success: true,
          errorMessage: null,
        );
      }
    } catch (e) {
      return Result<Member>(
        success: false,
        value: null,
        errorMessage: 'Log in failed.\n$e',
      );
    }

    return Result<Member>(
      success: false,
      value: null,
      errorMessage: 'Log in failed.\nPlease try again.',
    );
  }
}
