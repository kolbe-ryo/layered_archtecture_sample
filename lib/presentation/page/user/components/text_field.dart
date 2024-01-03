import 'package:flutter/material.dart';

/// Email アドレス入力用テキストフィールド
class EmailTextField extends StatelessWidget {
  const EmailTextField({
    required this.controller,
    super.key,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'メールアドレス',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
