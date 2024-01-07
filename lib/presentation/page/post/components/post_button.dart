import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/application/usecase/post/post_usecase.dart';
import 'package:layered_archtecture_sample/application/usecase/post/state/post_provider.dart';
import 'package:layered_archtecture_sample/presentation/presentation_mixin.dart';

// TODO
class PostButton extends ConsumerWidget with PresentationMixin {
  const PostButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        execute(
          context: context,
          action: () async {
            final navigator = Navigator.of(context);
            await ref.read(postUsecaseProvider).addPost(
                  image: image,
                  comment: comment,
                  user: user,
                );
            navigator.pop();
          },
          successMessage: 'Complete Posting!',
        );
      },
      child: const Text('Post'),
    );
  }
}
