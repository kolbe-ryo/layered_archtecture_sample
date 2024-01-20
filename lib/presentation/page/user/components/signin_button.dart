// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:layered_archtecture_sample/application/usecase/user/user_usecase.dart';
import 'package:layered_archtecture_sample/presentation/page/home_page.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/email_text_field.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/password_text_field.dart';
import 'package:layered_archtecture_sample/presentation/presentation_mixin.dart';

class SignInButton extends ConsumerWidget with PresentationMixin {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        await execute(
          context: context,
          action: () async {
            final navigator = Navigator.of(context);
            await ref.read(userUsecaseProvider).signIn(
                  email: ref.read(signinEmailControllerProvider).text,
                  password: ref.read(signinPasswordControllerProvider).text,
                );
            await navigator.pushReplacement(HomePage.route());
          },
          successMessage: '${ref.read(signinEmailControllerProvider).text} のユーザーでサインインしました',
        );
      },
      child: const Text('Sign In'),
    );
  }
}
