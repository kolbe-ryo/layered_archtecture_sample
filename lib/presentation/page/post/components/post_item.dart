// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:layered_archtecture_sample/domain/post/entity/post.dart';
import 'package:layered_archtecture_sample/util/datetime_converter.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post.user.imageUrl),
            ),
            title: Text(post.user.userName),
            subtitle: Text(
              // フォーマット等の画面表示に関するものは、ドメイン層ではなくプレゼンテーション層の責務なのでここで変換
              post.createdAt!.toFormatDateString,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Image.network(
            post.imageUrl,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(post.comment),
          ),
        ],
      ),
    );
  }
}
