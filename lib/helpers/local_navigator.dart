import 'package:cms/constants/controllers.dart';
import 'package:cms/routing/router.dart';
import 'package:cms/routing/routes.dart';
import 'package:flutter/material.dart';

Navigator localNavigator() =>   Navigator(
  key: navigationController.navigatorKey,
  onGenerateRoute: generateRoute,
  initialRoute: dashboardPageRoute,
);