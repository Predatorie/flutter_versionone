import 'package:flutter/material.dart';
import 'package:flutter_versionone/branding.dart';

BoxDecoration pageGradient() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment(1.0, 0.0), // 10% of the width, so there are ten blinds.
      colors: [versionOneRed, mastercamBlack],
      tileMode: TileMode.repeated, // repeats the gradient over the canvas
    ),
  );
}
