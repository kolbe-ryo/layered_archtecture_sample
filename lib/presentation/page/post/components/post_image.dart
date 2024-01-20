// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

/// 選択中投稿画像を保持するプロバイダー
final selectedImageProvider = StateProvider.autoDispose<File?>((ref) => null);

class PostImage extends ConsumerWidget {
  const PostImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedImage = ref.watch(
      selectedImageProvider.select((value) {
        if (value != null) {
          return Image.file(value);
        }
        return Icon(
          Icons.camera_alt,
          color: Colors.grey[800],
        );
      }),
    );
    return GestureDetector(
      onTap: () async {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);
        if (pickedFile == null) {
          return;
        }
        ref.watch(selectedImageProvider.notifier).state = File(pickedFile.path);
      },
      child: Container(
        height: 200,
        width: double.infinity,
        color: Colors.grey[300],
        child: selectedImage,
      ),
    );
  }
}
