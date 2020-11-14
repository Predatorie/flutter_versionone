import 'package:flutter/material.dart';
import 'package:flutter_versionone/branding.dart';

class PrimaryButton extends StatelessWidget {
  final FocusNode focusNode;

  PrimaryButton({this.labelText, this.onPressed, this.focusNode});

  final String labelText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      focusNode: focusNode,
      color: Colors.white,
      onPressed: onPressed,
      padding: EdgeInsets.all(22),
      child: Text(
        labelText.toUpperCase(),
        style: TextStyle(fontWeight: FontWeight.bold, color: mastercamBlack75),
      ),
    );
  }
}
