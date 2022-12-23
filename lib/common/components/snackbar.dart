import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showMySnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.white.withOpacity(0.9),
    borderWidth: 1,
    borderColor: Colors.grey.shade400.withOpacity(0.5),
  );
}
