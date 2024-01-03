import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ユーザー名入力用テキストフィールド
class UserNameTextField extends ConsumerWidget {
  const UserNameTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      // controller: ref.watch(userNameControllerProvider),
      decoration: const InputDecoration(
        labelText: 'ユーザー名',
      ),
    );
  }
}
