// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:layered_archtecture_sample/enum/index_mode.dart';
import 'package:layered_archtecture_sample/presentation/page/post/post_view_page.dart';
import 'package:layered_archtecture_sample/presentation/page/user/profile_page.dart';

final currentIndexProvider = StateProvider<int>((ref) => IndexMode.list.index);

class HomePage extends ConsumerWidget {
  const HomePage({super.key})
      // ignore: avoid_field_initializers_in_const_classes
      : _children = const [
          PostViewPage(),
          ProfilePage(),
        ];

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const HomePage());
  }

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
