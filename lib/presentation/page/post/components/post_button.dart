import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          action: action,
          successMessage: 'Complete Posting!',
        );
      },
      child: const Text('Post'),
    );
  }
}
