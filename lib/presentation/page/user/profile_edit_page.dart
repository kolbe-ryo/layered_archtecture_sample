import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileEditPage extends ConsumerWidget {
  const ProfileEditPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ProfileEditPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
