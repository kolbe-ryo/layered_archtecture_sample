import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/application/usecase/user/state/user_provider.dart';

final usernameStateProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController(text: ref.watch(userProvider)?.userName);
});

/// ユーザー名入力用テキストフィールド
class UserNameTextField extends ConsumerWidget {
  const UserNameTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: ref.watch(usernameStateProvider),
      decoration: const InputDecoration(
        labelText: 'ユーザー名',
      ),
    );
  }
}
