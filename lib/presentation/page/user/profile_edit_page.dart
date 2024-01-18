import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/register_button.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/user_image_edit.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/user_text_field.dart';

class ProfileEditPage extends ConsumerWidget {
  const ProfileEditPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ProfileEditPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール更新'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            UserImageEdit(),
            SizedBox(height: 16),
            UserNameTextField(),
            SizedBox(height: 16),
            RegisterButton(),
          ],
        ),
      ),
    );
  }
}
