import 'package:cms/constants/style.dart';
import 'package:cms/helpers/responsiveness.dart';
import 'package:cms/widgets/custom_text.dart';
import 'package:flutter/material.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) => 
  AppBar(
    leading: !ResponsiveWidget.isSmallScreen(context) ? 
    Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset("assets/icons/logo.png", width: 28,),
        ),
      ],
    ) : IconButton(icon: const Icon(Icons.menu), onPressed: (){
      key.currentState.openDrawer();
    },),
    elevation: 0,
    title: Row(
      children: [
        const Visibility(
          child: CustomText(
            text: "DCMS", 
            color: lightGrey,
            size: 20,
            weight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        IconButton(
          icon: Icon(
            Icons.settings, 
            color: dark.withOpacity(.7),
          ), 
          onPressed: (){},
        ),
        Stack(
          children: [
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: dark.withOpacity(.7),
              ), 
              onPressed: (){},
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                width: 12,
                height: 12,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: active,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: light, width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 1,
          height: 12,
          color: lightGrey,
        ),
        const SizedBox(
          width: 24,
        ),
        const CustomText(
          text: "Ramadhani Massawe",
          color: lightGrey,
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          decoration: BoxDecoration(
            color: active.withOpacity(.5),
            borderRadius: BorderRadius.circular(30)
          ),
          child: Container(
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(2),
            child: const CircleAvatar(
              backgroundColor: light,
              child: Icon(
                Icons.person_outline,
                color: dark,
              )
            ),
          ),
        ),
      ],
    ),
    iconTheme: const IconThemeData(
      color: dark,
    ),
    backgroundColor: Colors.transparent,
  );