import 'package:flutter/material.dart';

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
