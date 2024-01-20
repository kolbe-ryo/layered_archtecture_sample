// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signinEmailControllerProvider = StateProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

final signupEmailControllerProvider = StateProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

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
