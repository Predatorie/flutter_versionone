import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_versionone/branding.dart';

class UsernameEntry extends StatelessWidget {
  final TextEditingController usernameController;
  final FocusNode passwordFocus;

  const UsernameEntry(
      {Key key,
      @required this.usernameController,
      @required this.passwordFocus})
      : super(key: key);

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
              Icons.person,
              color: mastercamBlack25,
            ),
          ),
          Expanded(
            child: TextFormField(
              style: TextStyle(color: mastercamBlack25),
              controller: usernameController,
              obscureText: false,
              focusNode: passwordFocus,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
              validator: (value) => value.isEmpty ? 'Username required' : null,
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(passwordFocus),
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
