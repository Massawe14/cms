import 'package:flutter/material.dart';

import '../pages/content/content.dart';
import '../pages/dashboard/dashboard.dart';
import '../pages/device/device.dart';
import '../pages/display/display.dart';
import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case dashboardPageRoute:
      return _getPageRoute(const DashboardPage());
    case displayPageRoute:
      return _getPageRoute(const DisplayPage());
    case devicePageRoute:
      return _getPageRoute(const DevicePage());  
    case contentsPageRoute:
      return _getPageRoute(const ContentPage());
    default:
      return _getPageRoute(const DashboardPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}