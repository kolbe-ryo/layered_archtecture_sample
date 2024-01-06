import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Container();
  }
}
