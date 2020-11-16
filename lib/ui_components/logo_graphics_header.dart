import 'package:flutter/material.dart';
import 'package:flutter_versionone/branding.dart';

class LogoGraphicHeader extends StatelessWidget {
  LogoGraphicHeader();

  @override
  Widget build(BuildContext context) {
    var _imageLogo = 'assets/images/v1.png';
    // if (themeController.isDarkModeOn == true) {
    //  _imageLogo = 'assets/images/defaultDark.png';
    // }
    return Hero(
      tag: 'App Logo',
      child: Container(
        height: 120.0,
        width: 120.0,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          radius: 100.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: mastercamBlack25,
            width: 4.0,
          ),
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(_imageLogo)),
        ),
      ),
    );
  }
}
