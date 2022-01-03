import 'package:cms/helpers/responsiveness.dart';
import 'package:cms/widgets/large_screen.dart';
import 'package:cms/widgets/side_menu.dart';
import 'package:cms/widgets/small_screen.dart';
import 'package:cms/widgets/top_nav.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: const Drawer(
        child: SideMenu(),
      ), 
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(), 
        smallScreen: SmallScreen(),
      ),
    );
  }
}