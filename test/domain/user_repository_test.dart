// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:layered_archtecture_sample/domain/app_exception.dart';
import 'package:layered_archtecture_sample/domain/user/entity/user.dart';
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
  const incorrectEmail = 'incorrect_testexample.com';
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
      expect(
        () async {
          await container.read(userRepositoryProvider).signIn(
                email: correctEmail,
                password: incorrectPassword,
              );
        },
        throwsA(isA<AppException>()),
      );
    });

    test('passwordのみ正しいデータを設定するとExceptionがthrowされる', () async {
      expect(
        () async {
          await container.read(userRepositoryProvider).signIn(
                email: incorrectEmail,
                password: correctPassword,
              );
        },
        throwsA(isA<AppException>()),
      );
    });

    test('両方とも誤ったデータを設定するとExceptionがthrowされる', () async {
      expect(
        () async {
          await container.read(userRepositoryProvider).signIn(
                email: incorrectEmail,
                password: incorrectPassword,
              );
        },
        throwsA(isA<AppException>()),
      );
    });
  });

  group('サインアップに関するテスト', () {
    test('正しいemailと任意のpasswordデータに設定するとMockで設定したユーザーIDが返却される', () async {
      final userId = await container.read(userRepositoryProvider).signUp(
            email: correctEmail,
            password: correctPassword,
          );
      expect(userId, mock.mockUserId);
    });

    test('不正なemail形式と任意のpasswordを設定するとExceptionがthrowされる', () async {
      expect(
        () async {
          await container.read(userRepositoryProvider).signUp(
                email: incorrectEmail,
                password: incorrectPassword,
              );
        },
        throwsA(isA<AppException>()),
      );
    });
  });

  group('プロフィール登録（更新）に関するテスト', () {
    test('Userクラスを渡すとUserクラスが返却される', () async {
      const localUser = User(
        id: 'userId',
        userName: 'userName',
        imageUrl: 'userUrl',
      );
      final registerUser = await container.read(userRepositoryProvider).register(user: localUser);
      expect(registerUser.id, localUser.id);
      expect(registerUser.userName, localUser.userName);
      expect(registerUser.imageUrl, mock.mockUserImageUrl);
    });
  });

  group('削除に関するテスト', () {
    test('ユーザーIDを渡すとデータが削除されること', () {
      // Mock環境しかないため本テストは実施不可能
    });

    test('存在しないユーザーIDを渡すとExceptionがthrowされる', () async {
      expect(
        () async {
          await container.read(userRepositoryProvider).fetch(uid: 'none');
        },
        throwsA(isA<AppException>()),
      );
    });
  });

  group('取得に関するテスト', () {
    test('任意のユーザーIDを渡すとUserクラスが返却される', () async {
      const passedUid = 'userId';
      final localUser = await container.read(userRepositoryProvider).fetch(uid: passedUid);
      expect(localUser.id, passedUid);
      expect(localUser.userName, '${mock.mockUserName}2');
      expect(
        localUser.imageUrl,
        'https://1.bp.blogspot.com/-Ax7y4QVbj-c/X5OcVJn04jI/AAAAAAABb8g/aWzcFaud_V42uAc_3xPTisdrKCDeg_OvQCNcBGAsYHQ/s400/food_yukkejan.png',
      );
    });

    test('存在しないユーザーIDを渡すとExceptionがthrowされる', () async {
      expect(
        () async {
          await container.read(userRepositoryProvider).fetch(uid: 'none');
        },
        throwsA(isA<AppException>()),
      );
    });
  });
}
