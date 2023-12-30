import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/enum/index_mode.dart';

final currentIndexProvider = StateProvider<int>((ref) => IndexMode.list.index);

class HomePage extends ConsumerWidget {
  const HomePage({super.key})
      : _children = [
          const PostViewPage(),
          const ProfilePage(),
        ];

  final List<Widget> _children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(currentIndexProvider);
    return Scaffold(
      body: _children[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => ref.watch(currentIndexProvider.notifier).state = index,
        currentIndex: index,
        items: IndexMode.values
            .map(
              (e) => BottomNavigationBarItem(
                icon: e.icon,
                label: e.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
