// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signinPasswordControllerProvider = StateProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

final signupPasswordControllerProvider = StateProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

/// Password 入力用テキストフィールド
class PasswordTextField extends StatelessWidget {
  const PasswordTextField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'パスワード',
      ),
      obscureText: true,
    );
  }
}
