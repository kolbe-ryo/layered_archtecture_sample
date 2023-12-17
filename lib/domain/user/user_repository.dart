import 'package:layered_archtecture_sample/domain/user/entity/user.dart';

abstract class UserRepository {
  /// サインアップ
  Future<String> signUp({
    required String email,
    required String password,
  });

  /// サインイン
  Future<User> signIn({
    required String email,
    required String password,
  });

  /// User テーブルへユーザーレコードを追加 または 更新
  Future<User> register({required User user});

  /// User テーブル内のユーザーレコードを削除
  Future<void> delete({required String uid});

  /// User テーブル内のユーザーレコードを取得
  Future<User> fetch({required String uid});
}
