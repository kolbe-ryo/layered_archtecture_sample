// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:layered_archtecture_sample/application/usecase/user/state/user_provider.dart';

class UserImage extends ConsumerWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userImageUrl = ref.watch(userProvider.select((value) => value?.imageUrl));
    return CircleAvatar(
      radius: 50,
      backgroundImage: userImageUrl != null ? NetworkImage(userImageUrl) : null,
    );
  }
}
