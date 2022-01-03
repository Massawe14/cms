import 'package:cms/pages/content/content.dart';
import 'package:cms/pages/dashboard/dashboard.dart';
import 'package:cms/pages/device/device.dart';
import 'package:cms/routing/routes.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case dashboardPageRoute:
      return _getPageRoute(const DashboardPage());
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