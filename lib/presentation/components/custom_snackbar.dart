// Flutter imports:
import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar._({
    required String message,
    super.backgroundColor,
  }) : super(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        );

  static void showFailure(
    ScaffoldMessengerState scaffoldMessenger, {
    required String message,
  }) {
    scaffoldMessenger.showSnackBar(
      CustomSnackBar._(
        message: message,
        backgroundColor: Colors.red,
      ),
    );
  }

  static void showSuccess(
    ScaffoldMessengerState scaffoldMessenger, {
    required String message,
  }) {
    scaffoldMessenger.showSnackBar(
      CustomSnackBar._(message: message),
    );
  }
}
