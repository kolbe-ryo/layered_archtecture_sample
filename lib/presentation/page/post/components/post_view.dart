import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/application/usecase/post/state/post_provider.dart';
import 'package:layered_archtecture_sample/presentation/page/post/components/post_item.dart';

class PostView extends ConsumerWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(postProvider).when(
          data: (data) {
            return RefreshIndicator(
              onRefresh: () async => ref.invalidate(postProvider),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return PostItem(post: data[index]);
                },
              ),
            );
          },
          error: (error, stack) => Center(
            child: Text('$error'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
