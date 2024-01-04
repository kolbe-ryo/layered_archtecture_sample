import 'package:flutter/material.dart';
import 'package:layered_archtecture_sample/domain/app_exception.dart';
import 'package:layered_archtecture_sample/presentation/component/custom_snackbar.dart';

mixin PresentationMixin {
  Future<void> execute({
    required BuildContext context,
    required Future<void> Function() action,
    required String successMessage,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await action();
      CustomSnackBar.showSuccess(
        scaffoldMessenger,
        message: successMessage,
      );
    } on AppException catch (e) {
      CustomSnackBar.showSuccess(
        scaffoldMessenger,
        message: e.toString(),
      );
    }
  }
}
