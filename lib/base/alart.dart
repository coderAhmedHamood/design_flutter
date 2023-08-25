import 'package:clean_dialog/clean_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarService {
  static void showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: Duration(seconds: 2),
      icon: Icon(Icons.check),
    );
  }

  static void showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: Duration(seconds: 2),
      icon: Icon(Icons.error),
    );
  }
  static void showWarningSnackbar(String message) {
    Get.snackbar(
      'Warning',
      message,
      backgroundColor: Colors.yellow,
      colorText: Colors.black,
      duration: Duration(seconds: 4),
      icon: Icon(Icons.warning),
    );
  }

static void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => CleanDialog(
      title: 'Error',
      content: 'We were not able to update your information.',
      backgroundColor: const Color(0XFFbe3a2c),
      titleTextStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      contentTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      actions: [
        CleanDialogActionButtons(
          actionTitle: 'Cancel',
          onPressed: () => Navigator.pop(context),
        ),
        CleanDialogActionButtons(
          actionTitle: 'Try again',
          textColor: const Color(0XFF27ae61),
          onPressed: () {},
        ),
      ],
    ),
  );
}

}



 