import 'package:flutter/material.dart';

darkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.purple.shade200,
  );
}

lightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
  );
}
