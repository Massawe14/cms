import 'package:cms/constants/controllers.dart';
import 'package:cms/helpers/responsiveness.dart';
import 'package:cms/pages/dashboard/widgets/dashboard_cards_large.dart';
import 'package:cms/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/dashboard_cards_medium.dart';
import 'widgets/dashboard_cards_small.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 
              ResponsiveWidget.isSmallScreen(context) ? 56 : 6
              ),
              child: CustomText(
                text: menuController.activeItem.value,
                size: 24,
                weight: FontWeight.bold,
              ),
            ),
          ],
        )),
        Expanded(
          child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) || 
                  ResponsiveWidget.isMediumScreen(context)) 
                if (ResponsiveWidget.isCustomSize(context))
                  const DashboardCardsMediumScreen()
                else
                  const DashboardCardsLargeScreen()
              else
                const DashboardCardsSmallScreen()
            ],
          ),
        ),
      ],
    );
  }
}