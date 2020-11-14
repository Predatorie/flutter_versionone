import 'package:flutter/material.dart';
import 'package:flutter_versionone/branding.dart';

class PasswordEntry extends StatelessWidget {
  final TextEditingController passwordController;
  final FocusNode buttonFocus;

  const PasswordEntry({
    Key key,
    @required this.passwordController,
    @required this.buttonFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 6.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Theme.of(context).primaryColorLight,
              width: 0.5,
              style: BorderStyle.solid),
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
              style: TextStyle(color: mastercamBlack25),
              controller: passwordController,
              obscureText: true,
              focusNode: buttonFocus,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
              validator: (value) => value.isEmpty ? 'Password required' : null,
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(buttonFocus),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '*********',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
