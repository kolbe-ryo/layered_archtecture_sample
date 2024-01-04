import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/application/usecase/user/state/user_provider.dart';

class UserImage extends ConsumerWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return CircleAvatar(
      radius: 50,
      backgroundImage: user == null ? null : NetworkImage(user.imageUrl),
    );
  }
}
