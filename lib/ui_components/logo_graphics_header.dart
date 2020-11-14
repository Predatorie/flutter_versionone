import 'package:flutter/material.dart';
import 'package:flutter_versionone/branding.dart';

class LogoGraphicHeader extends StatelessWidget {
  LogoGraphicHeader();

  @override
  Widget build(BuildContext context) {
    String _imageLogo = 'assets/images/v1.png';
    // if (themeController.isDarkModeOn == true) {
    //  _imageLogo = 'assets/images/defaultDark.png';
    // }
    return Hero(
      tag: 'App Logo',
      child: CircleAvatar(
          foregroundColor: mastercamRed,
          backgroundColor: Colors.transparent,
          radius: 60.0,
          child: ClipOval(
            child: Image.asset(
              _imageLogo,
              fit: BoxFit.cover,
              width: 120.0,
              height: 120.0,
            ),
          )),
    );
  }
}
