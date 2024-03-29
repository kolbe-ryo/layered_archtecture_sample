// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:layered_archtecture_sample/presentation/page/user/components/email_text_field.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/password_text_field.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/signin_button.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/signup_button.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サインイン'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmailTextField(
              controller: ref.watch(signinEmailControllerProvider),
            ),
            const SizedBox(height: 16),
            PasswordTextField(
              controller: ref.watch(signinPasswordControllerProvider),
            ),
            const SizedBox(height: 16),
            const SignInButton(),
            const SizedBox(height: 16),
            const SignUpButton(),
          ],
        ),
      ),
    );
  }
}
