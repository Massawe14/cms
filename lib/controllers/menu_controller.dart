import 'package:cms/constants/style.dart';
import 'package:cms/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController{
  static MenuController instance = Get.find();
  var activeItem = dashboardPageDisplayName.obs;
  
  var hoverItem = "".obs;

  changeActiveitemTo(String itemName){
    activeItem.value = itemName;
  }

  onHover(String itemName){
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName){
    switch (itemName) {
      case dashboardPageDisplayName:
        return _customIcon(Icons.dashboard, itemName);
      case displayPageDisplayName:
        return _customIcon(Icons.tv, itemName);
      case devicePageDisplayName:
        return _customIcon(Icons.devices, itemName);
      case contentsPageDisplayName:
        return _customIcon(Icons.content_copy, itemName); 
      case authenticationPageDisplayName:
        return _customIcon(Icons.exit_to_app, itemName);   
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName){
    if(isActive(itemName)) return Icon(icon, size: 22, color: dark);

    return Icon(icon, color: isHovering(itemName) ? dark : lightGrey,);
  }
}