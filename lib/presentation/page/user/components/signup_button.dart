import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/application/usecase/user/user_usecase.dart';
import 'package:layered_archtecture_sample/presentation/page/home_page.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/email_text_field.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/password_text_field.dart';
import 'package:layered_archtecture_sample/presentation/page/user/profile_edit_page.dart';
import 'package:layered_archtecture_sample/presentation/presentation_mixin.dart';

class SignUpButton extends ConsumerWidget with PresentationMixin {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        await execute(
          context: context,
          action: () async {
            final navigator = Navigator.of(context);
            await ref.read(userUsecaseProvider).signUp(
                  email: ref.read(signinEmailControllerProvider).text,
                  password: ref.read(signinPasswordControllerProvider).text,
                );

            navigator.pushAndRemoveUntil(HomePage.route(), (route) => false);
            navigator.push(ProfileEditPage.route());
          },
          successMessage: 'サインアップが完了しました',
        );
      },
      child: const Text('Sign Up'),
    );
  }
}
