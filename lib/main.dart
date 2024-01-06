import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/domain/post/post_repository.dart';
import 'package:layered_archtecture_sample/domain/service/storage_service.dart';
import 'package:layered_archtecture_sample/domain/user/user_repository.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_post_repository.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_storage_service.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_user_repository.dart';
import 'package:layered_archtecture_sample/presentation/app.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        // implement providers
        userRepositoryProvider.overrideWithValue(MockUserRepository()),
        postRepositoryProvider.overrideWithValue(MockPostRepository()),
        storageServiceProvider.overrideWithValue(MockStorageService()),
        // userUsecaseProvider.overrideWithValue(MockUserUsecase()),
      ],
      child: const App(),
    ),
  );
}
