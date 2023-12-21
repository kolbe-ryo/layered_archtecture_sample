import 'dart:io';

import 'package:layered_archtecture_sample/domain/post/entity/post.dart';
import 'package:layered_archtecture_sample/domain/user/entity/user.dart';
import 'package:riverpod/riverpod.dart';

class PostUsecase {
  PostUsecase(this._ref);

  final Ref _ref;

  /// 新規投稿をする
  Future<void> addPost({
    required File? image,
    required String comment,
    required User? user,
  }) async {}

  /// 投稿の全件取得処理
  ///
  /// 取得後に作成日時が新しい順に並び替える
  Future<List<Post>> fetchAll() async {}
}
