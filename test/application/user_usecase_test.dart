// Dart imports:
import 'dart:io';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:layered_archtecture_sample/application/usecase/user/state/user_provider.dart';
import 'package:layered_archtecture_sample/application/usecase/user/user_usecase.dart';
import 'package:layered_archtecture_sample/domain/service/storage_service.dart';
import 'package:layered_archtecture_sample/domain/user/user_repository.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_storage_service.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_user_repository.dart';
import 'package:layered_archtecture_sample/util/logger.dart';

void main() {
  const email = 'test@example.com';
  const password = 'test';

  /// Arrangement
  final mockUserRepo = MockUserRepository();
  final mockStorageService = MockStorageService();
  final provideContainer = ProviderContainer(
    overrides: [
      userRepositoryProvider.overrideWithValue(mockUserRepo),
      storageServiceProvider.overrideWithValue(mockStorageService),
    ],
  );
  group('SignUpに関するテスト', () {
    test('誤ったemail/passwordを渡すと初期値のUIDがstateに保持される', () async {
      try {
        await provideContainer.read(userRepositoryProvider).signIn(
              email: 'failure-email',
              password: password,
            );
      } on Exception catch (e) {
        logger.i(e);
      }
      final uid = provideContainer.read(uidProvider);
      expect(uid, null);
    });
    test('正しいemail/passwordを渡すと対応するUIDがstateに保持される', () async {
      await provideContainer.read(userUsecaseProvider).signUp(
            email: email,
            password: password,
          );
      final uid = provideContainer.read(uidProvider);
      expect(uid, mockUserRepo.mockUserId);
      provideContainer.read(uidProvider.notifier).update((state) => null);
    });
  });

  group('SignInに関するテスト', () {
    test('誤ったemail/passwordを渡すと対応する初期値のUIDとUserがstateに保持される', () async {
      try {
        await provideContainer.read(userUsecaseProvider).signIn(
              email: 'failure-email',
              password: password,
            );
      } on Exception catch (e) {
        logger.i(e);
      }
      final uid = provideContainer.read(uidProvider);
      expect(uid, null);
    });
    test('正しいemail/passwordを渡すと対応するUIDとUserがそれぞれのstateに保持される', () async {
      await provideContainer.read(userUsecaseProvider).signIn(
            email: email,
            password: password,
          );
      final user = provideContainer.read(userProvider);
      expect(user?.id, mockUserRepo.mockUserId);

      provideContainer.read(userProvider.notifier).setUser = null;
    });
  });
  group('更新に関するテスト', () {
    test('UIDがnullの場合初期値のUserがstateに保持される', () async {
      await provideContainer.read(userUsecaseProvider).register(
            uid: null,
            userName: 'userName',
            image: File('path'),
          );
      final user = provideContainer.read(userProvider);
      expect(user, null);
    });
    test('任意のUID・ユーザー名・任意の画像パスを渡すと、設定値を持つUserクラスがstateに保持される', () async {
      await provideContainer.read(userUsecaseProvider).register(
            uid: 'uid',
            userName: 'userName',
            image: File('path'),
          );
      final user = provideContainer.read(userProvider);
      expect(user?.id, 'uid');
    });
  });
}
