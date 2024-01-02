import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/enum/index_mode.dart';
import 'package:layered_archtecture_sample/presentation/page/post/post_page.dart';

class PostViewPage extends ConsumerWidget {
  const PostViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(IndexMode.list.label),
        automaticallyImplyLeading: false,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PostPage(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.photo_camera),
      ),
    );
  }
}
