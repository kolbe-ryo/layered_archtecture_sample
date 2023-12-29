import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key})
      : _children = [
          const PostViewPage(),
          const ProfilePage(),
        ];

  final List<Widget> _children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = :
    return Scaffold(
      body: _children[index],
      bottomNavigationBar: BottomNavigationBar(),
    );
  }
}
