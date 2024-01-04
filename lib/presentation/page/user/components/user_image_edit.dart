import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:layered_archtecture_sample/application/usecase/user/state/user_provider.dart';

final selectedImageProvider = StateProvider.autoDispose<ImageProvider<Object>?>((ref) {
  if (ref.controller.state != null) {
    return ref.controller.state;
  }
  final remoteUrl = ref.watch(userProvider.select((value) => value?.imageUrl));
  if (remoteUrl != null) {
    return NetworkImage(remoteUrl);
  }
  return null;
});

class UserImageEdit extends ConsumerWidget {
  const UserImageEdit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedImage = ref.watch(selectedImageProvider);
    return CircleAvatar(
      radius: 50,
      backgroundImage: selectedImage,
      child: Padding(
        padding: const EdgeInsets.only(top: 65.0, left: 67.5),
        child: IconButton(
          icon: const Icon(Icons.add_a_photo_rounded),
          onPressed: () async {
            final imagePicker = ImagePicker();
            final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
            if (pickedFile == null) {
              return;
            }
            final file = File(pickedFile.path);
            ref.watch(selectedImageProvider.notifier).update((state) => FileImage(file));
          },
        ),
      ),
    );
  }
}
