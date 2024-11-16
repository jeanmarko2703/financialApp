import 'package:financial/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static String initialRoute = 'AmountScreen';

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {
      "HomeScreen": (BuildContext context) => const HomeScreen(),
      "AmountScreen": (BuildContext context) => const AmountScreen(),
    };

    return routes;
  }
}
