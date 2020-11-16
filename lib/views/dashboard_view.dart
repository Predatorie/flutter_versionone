import 'package:flutter/material.dart';
import 'package:flutter_versionone/branding.dart';
import 'package:flutter_versionone/controllers/dashboard_controller.dart';
import 'package:flutter_versionone/ui_components/page_grdient.dart';
import 'package:get/get.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: versionOneRed,
      appBar: AppBar(
        title: Text('Version One'),
      ),
      body: Container(
        decoration: pageGradient(),
        child: Center(
            child: Text(
          'dashboard loaded',
          style: TextStyle(color: Colors.white),
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: versionOneBackground,
        elevation: 1.0,
        unselectedLabelStyle: TextStyle(color: Colors.white),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: Colors.white,
            ),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_alt,
              color: Colors.white,
            ),
            label: 'School',
          ),
        ],
      ),
    );
  }
}
