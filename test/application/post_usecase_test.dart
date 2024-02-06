// Dart imports:
import 'dart:io';

// Package imports:
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:layered_archtecture_sample/application/usecase/post/post_usecase.dart';
import 'package:layered_archtecture_sample/domain/app_exception.dart';
import 'package:layered_archtecture_sample/domain/post/post_repository.dart';
import 'package:layered_archtecture_sample/domain/service/storage_service.dart';
import 'package:layered_archtecture_sample/domain/user/entity/user.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_post_repository.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_storage_service.dart';

void main() {
  final mockPostRepository = MockPostRepository();
  final mockStorageService = MockStorageService();

  final providerContainer = ProviderContainer(
    overrides: [
      postRepositoryProvider.overrideWithValue(mockPostRepository),
      storageServiceProvider.overrideWithValue(mockStorageService),
    ],
  );

  group('投稿全件取得に関するテスト', () {
    test('投稿一覧が昇順のリストとして返却される', () async {
      final posts = await providerContainer.read(postUsecaseProvider).fetchAll();
      final sortedList = mockPostRepository.mockPosts.sorted((a, b) => b.createdAt!.compareTo(a.createdAt!));
      final match = const DeepCollectionEquality().equals(posts, sortedList);
      expect(match, true);
    });
  });
  group('投稿に関するテスト', () {
    const mockUser = User(id: 'id', userName: 'userName', imageUrl: 'imageUrl');
    test('画像が渡されない場合、例外がthrowされる', () async {
      expect(
        () async {
          await providerContainer.read(postUsecaseProvider).addPost(
                image: null,
                comment: 'comment',
                user: mockUser,
              );
        },
        throwsA(isA<AppException>()),
      );
    });
    test('ユーザーが渡されない場合、例外がthrowされる', () async {
      expect(
        () async {
          await providerContainer.read(postUsecaseProvider).addPost(
                image: File('path'),
                comment: 'comment',
                user: null,
              );
        },
        throwsA(isA<AppException>()),
      );
    });
    test('任意の画像・ユーザー・コメントが渡された場合、前の内容の投稿が1件追加される', () async {
      await providerContainer.read(postUsecaseProvider).addPost(
            image: File('path'),
            comment: 'comment',
            user: mockUser,
          );
      // 追加されたテストはMockUsecaseの固定ユーザーであること
      final posts = await providerContainer.read(postUsecaseProvider).fetchAll();
      expect(posts.first.id, '009');
    });
  });
}
