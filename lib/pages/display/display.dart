import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';
import '../../widgets/custom_text.dart';
import 'widgets/display_table.dart';

class DisplayPage extends StatelessWidget {
  const DisplayPage({ Key key }) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.search,
                        color: Colors.orangeAccent,
                      ),
                    ],
                  ),
                  GFButton(
                    onPressed: (){},
                    text: "Add Display",
                    icon: const Icon(Icons.add, color: Colors.white,),
                    shape: GFButtonShape.pills,
                    color: Colors.orangeAccent,
                  ),  
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const DisplayTable(),
            ],
          ),
        ),
      ],
    );
  }
}