import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignUpに関するテスト', () {
    test('正しいemail/passwordを渡すと対応するUIDがstateに保持される', () {});
    test('誤ったemail/passwordを渡すと初期値のUIDがstateに保持される', () {});
  });
  group('SignInに関するテスト', () {
    test('正しいemail/passwordを渡すと対応するUIDとUserがそれぞれのstateに保持される', () {});
    test('誤ったemail/passwordを渡すと対応する初期値のUIDとUserがstateに保持される', () {});
  });
  group('更新に関するテスト', () {
    test('UIDがnullの場合初期値のUserがstateに保持される', () {});
    test('任意のUID・ユーザー名・任意の画像パスを渡すと、設定値を持つUserクラスがstateに保持される', () {});
  });
}
