import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/application/usecase/user/state/user_provider.dart';
import 'package:layered_archtecture_sample/application/usecase/user/user_usecase.dart';
import 'package:layered_archtecture_sample/enum/index_mode.dart';
import 'package:layered_archtecture_sample/presentation/page/home_page.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/user_image_edit.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/user_text_field.dart';
import 'package:layered_archtecture_sample/presentation/presentation_mixin.dart';

class RegisterButton extends ConsumerWidget with PresentationMixin {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        await execute(
          context: context,
          action: () async {
            final navigator = Navigator.of(context);
            await ref.read(userUsecaseProvider).register(
                  uid: ref.read(uidProvider),
                  userName: ref.read(usernameStateProvider).text,
                  image: ref.read(selectedImageProvider),
                );
            ref.watch(currentIndexProvider.notifier).update((state) => IndexMode.profile.index);
            navigator.pop();
          },
          successMessage: 'プロフィールを登録しました',
        );
      },
      child: const Text('Regist'),
    );
  }
}
