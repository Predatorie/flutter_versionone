import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final String title = 'LOGIN';

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    usernameController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }

  //Method to handle user sign in using name and password
  signInWithEmailAndPassword(BuildContext context) async {}
}
