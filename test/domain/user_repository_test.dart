import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layered_archtecture_sample/domain/app_exception.dart';
import 'package:layered_archtecture_sample/domain/user/user_repository.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_user_repository.dart';

void main() {
  // 準備
  final mock = MockUserRepository();
  final container = ProviderContainer(
    overrides: [
      // Mockのリポジトリ結果を返却するように設定
      userRepositoryProvider.overrideWithValue(mock),
    ],
  );
  const correctEmail = 'test@example.com';
  const incorrectEmail = 'incorrect_test@example.com';
  const correctPassword = 'test';
  const incorrectPassword = 'incorrect_test';

  group('サインインに関するテスト', () {
    test('両方正しいデータに設定するとMockで設定したユーザー情報が返却される', () async {
      final user = await container.read(userRepositoryProvider).signIn(
            email: correctEmail,
            password: correctPassword,
          );
      expect(user.id, mock.mockUserId);
      expect(user.userName, mock.mockUserName);
      expect(user.imageUrl, mock.mockUserImageUrl);
    });

    test('emailのみ正しいデータを設定するとExceptionがthrowされる', () async {
      try {
        await container.read(userRepositoryProvider).signIn(
              email: correctEmail,
              password: incorrectPassword,
            );
      } on AppException catch (e) {
        expect(e.message, 'メールアドレス または パスワードが異なります');
      }
    });

    test('passwordのみ正しいデータを設定するとExceptionがthrowされる', () async {
      try {
        await container.read(userRepositoryProvider).signIn(
              email: incorrectEmail,
              password: correctPassword,
            );
      } on AppException catch (e) {
        expect(e.message, 'メールアドレス または パスワードが異なります');
      }
    });

    test('両方とも誤ったデータを設定するとExceptionがthrowされる', () async {
      try {
        await container.read(userRepositoryProvider).signIn(
              email: incorrectEmail,
              password: incorrectPassword,
            );
      } on AppException catch (e) {
        expect(e.message, 'メールアドレス または パスワードが異なります');
      }
    });
  });
  // TODO サインアップのテスト
  group('サインアップに関するテスト', () {
    test('両方正しいデータに設定するとMockで設定したユーザーIDが返却される', () async {
      final userId = await container.read(userRepositoryProvider).signUp(
            email: correctEmail,
            password: correctPassword,
          );
      expect(userId, mock.mockUserId);
    });

    // TODO: exception test
  });
  // TODO 登録に関するテスト
  // TODO 削除に関するテスト
  // TODO 取得に関するテスト
}
