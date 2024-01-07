import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/application/usecase/post/post_usecase.dart';
import 'package:layered_archtecture_sample/application/usecase/user/state/user_provider.dart';
import 'package:layered_archtecture_sample/presentation/page/post/components/post_comment_field.dart';
import 'package:layered_archtecture_sample/presentation/page/post/components/post_image.dart';
import 'package:layered_archtecture_sample/presentation/presentation_mixin.dart';

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
                  image: ref.read(selectedImageProvider),
                  comment: ref.read(postCommentFieldControllerProvider).text,
                  user: ref.read(userProvider),
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
