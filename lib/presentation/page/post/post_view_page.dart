// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:layered_archtecture_sample/enum/index_mode.dart';
import 'package:layered_archtecture_sample/presentation/page/components/post_view.dart';
import 'package:layered_archtecture_sample/presentation/page/post/post_page.dart';

class PostViewPage extends StatelessWidget {
  const PostViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(IndexMode.list.label),
        automaticallyImplyLeading: false,
      ),
      body: const PostView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PostPage.route(),
          );
        },
        child: const Icon(Icons.photo_camera),
      ),
    );
  }
}
