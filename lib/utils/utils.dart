import 'package:flutter/material.dart';

class Utils{
  static GlobalKey<NavigatorState> mainKey = GlobalKey();
  static GlobalKey<NavigatorState> dashboardKey = GlobalKey();
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  static GlobalKey<FormState> loginPageFormKey = GlobalKey<FormState>();
}