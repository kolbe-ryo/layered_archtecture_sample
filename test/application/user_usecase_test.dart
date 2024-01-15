import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layered_archtecture_sample/domain/user/user_repository.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_user_repository.dart';

void main() {
  // TODO
  /// Arrangement
  final mockUserRepo = MockUserRepository();
  final provideContainer = ProviderContainer(
    overrides: [
      userRepositoryProvider.overrideWithValue(mockUserRepo),
    ],
  );

  group('SignUpに関するテスト', () {
    test('正しいemail/passwordを渡すと対応するUIDがstateに保持される', () async {
      //TODO something
    });
    test('誤ったemail/passwordを渡すと初期値のUIDがstateに保持される', () async {});
  });
  group('SignInに関するテスト', () {
    test('正しいemail/passwordを渡すと対応するUIDとUserがそれぞれのstateに保持される', () async {});
    test('誤ったemail/passwordを渡すと対応する初期値のUIDとUserがstateに保持される', () async {});
  });
  group('更新に関するテスト', () {
    test('UIDがnullの場合初期値のUserがstateに保持される', () async {});
    test('任意のUID・ユーザー名・任意の画像パスを渡すと、設定値を持つUserクラスがstateに保持される', () async {});
  });
}
