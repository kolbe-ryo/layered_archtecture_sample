import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

// TODO: userImageを取得した方が良くない？
final selectedImageProvider = StateProvider.autoDispose<File?>((_) => null);

class UserImageEdit extends ConsumerWidget {
  const UserImageEdit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: null,
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
            // TODO: 画像の保存処理
          },
        ),
      ),
    );
  }
}
