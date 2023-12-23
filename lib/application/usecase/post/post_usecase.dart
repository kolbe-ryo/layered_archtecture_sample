import 'dart:io';

import 'package:layered_archtecture_sample/application/usecase/post/state/post_provider.dart';
import 'package:layered_archtecture_sample/domain/app_exception.dart';
import 'package:layered_archtecture_sample/domain/post/entity/post.dart';
import 'package:layered_archtecture_sample/domain/post/post_repository.dart';
import 'package:layered_archtecture_sample/domain/service/storage_service.dart';
import 'package:layered_archtecture_sample/domain/user/entity/user.dart';
import 'package:riverpod/riverpod.dart';

final postUsecaseProvider = Provider<PostUsecase>(PostUsecase.new);

class PostUsecase {
  PostUsecase(this._ref);

  final Ref _ref;

  /// 新規投稿をする
  Future<void> addPost({
    required File? image,
    required String comment,
    required User? user,
  }) async {
    if (image == null) {
      throw const AppException('画像を選択してください');
    }
    if (user == null) {
      throw const AppException();
    }

    final imageUrl = await _ref.read(storageServiceProvider).uploadImage(image: image);
    await _ref.read(postRepositoryProvider).add(
          post: Post(
            id: null,
            user: user,
            imageUrl: imageUrl,
            comment: comment,
            createdAt: DateTime.now(),
          ),
        );
    // 明示的にリフレッシュしたい時にコール
    _ref.invalidate(postProvider);
  }

  /// 投稿の全件取得処理
  ///
  /// 取得後に作成日時が新しい順に並び替える
  Future<List<Post>> fetchAll() async {
    final posts = await _ref.read(postRepositoryProvider).fetchAll();
  }
}
