import 'package:cms/constants/controllers.dart';
import 'package:cms/constants/style.dart';
import 'package:cms/helpers/responsiveness.dart';
import 'package:cms/routing/routes.dart';
import 'package:cms/widgets/custom_text.dart';
import 'package:cms/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if(ResponsiveWidget.isSmallScreen(context))
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: _width / 48,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 12,
                    ),
                    child: Image.asset("assets/icons/cms.png"),
                  ),
                  const Flexible(
                    child: CustomText(
                      text: "CMS",
                      size: 20,
                      weight: FontWeight.bold,
                      color: active,
                    ),
                  ),
                  SizedBox(
                    width: _width / 48,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItemRoutes.map((item) => SideMenuItem(
              itemName: item.name,
              onTap: (){
                if(item.route == authenticationPageRoute){
                  Get.offAllNamed(authenticationPageRoute);
                  menuController.changeActiveitemTo(dashboardPageDisplayName);
                }
                if (!menuController.isActive(item.name)) {
                  menuController.changeActiveitemTo(item.name);
                  if(ResponsiveWidget.isSmallScreen(context)) {
                    Get.back();
                  }
                  navigationController.navigateTo(item.route);
                }
              },
            )).toList(),
          ),
        ],
      ),
    );
  }
}