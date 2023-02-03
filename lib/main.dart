import 'package:astrology_app/utils/theme.dart';
import 'package:astrology_app/views/screens/details_page.dart';
import 'package:astrology_app/views/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme:lightTheme(),
      darkTheme: darkTheme(),
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/", page: () => HomePage()),
        GetPage(name: "/details_page", page: () => DetailsPage()),
      ],
    ),
  );
}
