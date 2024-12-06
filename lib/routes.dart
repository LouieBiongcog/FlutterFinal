//routes.dart

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'info_page.dart';
import 'profile_page.dart';

class AppRoutes {

  static const String home = '/';
  static const String info = '/info';
  static const String profile = '/profile';


  static Map<String, WidgetBuilder> define() {
    return {
      home: (context) => HomePage(),
      info: (context) => InfoPage(),
      profile: (context) => ProfilePage(),
    };
  }
}
