import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/email_text_field.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/password_text_field.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/signup_button.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サインアップ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            EmailTextField(
              controller: ref.watch(signupEmailControllerProvider),
            ),
            const SizedBox(height: 16),
            PasswordTextField(
              controller: ref.watch(signupPasswordControllerProvider),
            ),
            const SizedBox(height: 16),
            const SignUpButton(),
          ],
        ),
      ),
    );
  }
}
