import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> checkConnectivityNow() async {
  ConnectivityResult connectivityResult =
      await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

noNetworkSnackBar() {
  return Get.snackbar(
    "No Internet",
    "Check your Internet Connection",
    icon: const Icon(Icons.signal_wifi_connected_no_internet_4, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 1),
    barBlur: 0,
    margin: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
    colorText: Colors.white,
    backgroundColor: Colors.red,
    animationDuration: const Duration(seconds: 1),
  );
}
