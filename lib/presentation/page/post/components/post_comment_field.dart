// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postCommentFieldControllerProvider =
    StateProvider.autoDispose<TextEditingController>((ref) => TextEditingController());

class PostCommentField extends ConsumerWidget {
  const PostCommentField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: ref.watch(postCommentFieldControllerProvider),
      decoration: const InputDecoration(
        labelText: 'コメント',
        border: OutlineInputBorder(),
      ),
      maxLines: 4,
    );
  }
}
