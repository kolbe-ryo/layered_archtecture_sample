import 'package:flutter/material.dart';
import 'package:layered_archtecture_sample/domain/post/entity/post.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
