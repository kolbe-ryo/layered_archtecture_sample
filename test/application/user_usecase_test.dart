import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layered_archtecture_sample/application/usecase/user/state/user_provider.dart';
import 'package:layered_archtecture_sample/application/usecase/user/user_usecase.dart';
import 'package:layered_archtecture_sample/domain/user/user_repository.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_user_repository.dart';

void main() {
  const email = 'test@example.com';
  const password = 'test';

  group('SignUpに関するテスト', () {
    /// Arrangement
    final mockUserRepo = MockUserRepository();
    final provideContainer = ProviderContainer(
      overrides: [
        userRepositoryProvider.overrideWithValue(mockUserRepo),
      ],
    );
    test('誤ったemail/passwordを渡すと初期値のUIDがstateに保持される', () async {
      try {
        await provideContainer.read(userRepositoryProvider).signIn(
              email: 'failure-email',
              password: password,
            );
      } catch (e) {}
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
    });
  });
  group('SignInに関するテスト', () {
    test('誤ったemail/passwordを渡すと対応する初期値のUIDとUserがstateに保持される', () async {});
    test('正しいemail/passwordを渡すと対応するUIDとUserがそれぞれのstateに保持される', () async {});
  });
  group('更新に関するテスト', () {
    test('UIDがnullの場合初期値のUserがstateに保持される', () async {});
    test('任意のUID・ユーザー名・任意の画像パスを渡すと、設定値を持つUserクラスがstateに保持される', () async {});
  });
}
