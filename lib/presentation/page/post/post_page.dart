import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/presentation/page/post/components/post_button.dart';
import 'package:layered_archtecture_sample/presentation/page/post/components/post_comment_field.dart';
import 'package:layered_archtecture_sample/presentation/page/post/components/post_image.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const PostPage(),
      fullscreenDialog: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            PostImage(),
            SizedBox(height: 16),
            PostCommentField(),
            SizedBox(height: 16),
            PostButton(),
          ],
        ),
      ),
    );
  }
}
