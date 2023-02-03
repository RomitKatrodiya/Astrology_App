import 'package:astrology_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

changeThem(astrologyController){
  return IconButton(
    onPressed: () {
      Get.changeTheme(
          (astrologyController.isLight.value) ?  darkTheme():lightTheme());
      astrologyController.isLightChange();
    },
    icon:Icon((astrologyController.isLight.value) ? Icons.dark_mode : Icons.light_mode),
  );
}