import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';
import '../../widgets/custom_text.dart';
import 'widgets/reports_table.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({ Key key }) : super(key: key);

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
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const CustomText(
                  text: "Login",
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const ReportsTable(),
            ],
          ),
        ),
      ],
    );
  }
}