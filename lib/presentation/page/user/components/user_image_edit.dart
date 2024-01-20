// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:layered_archtecture_sample/application/usecase/user/state/user_provider.dart';

/// 選択中画像を保持するプロバイダー
final selectedImageProvider = StateProvider.autoDispose<File?>((_) => null);

class UserImageEdit extends ConsumerWidget {
  const UserImageEdit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedImage = ref.watch(
      selectedImageProvider.select(
        (value) => value != null ? FileImage(value) : null,
      ),
    );
    final remoteImageUrl = ref.watch(
      userProvider.select(
        (value) => value?.imageUrl != null ? NetworkImage(value!.imageUrl) as ImageProvider<Object>? : null,
      ),
    );

    return CircleAvatar(
      radius: 50,
      backgroundImage: selectedImage ?? remoteImageUrl,
      child: Padding(
        padding: const EdgeInsets.only(top: 65, left: 67.5),
        child: IconButton(
          icon: const Icon(Icons.add_a_photo_rounded),
          onPressed: () async {
            final picker = ImagePicker();
            final pickedFile = await picker.pickImage(source: ImageSource.gallery);
            if (pickedFile == null) {
              return;
            }
            ref.watch(selectedImageProvider.notifier).state = File(pickedFile.path);
          },
        ),
      ),
    );
  }
}
