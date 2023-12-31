import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/enum/index_mode.dart';

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
    );
  }
}
