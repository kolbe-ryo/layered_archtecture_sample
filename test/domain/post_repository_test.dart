import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layered_archtecture_sample/domain/post/entity/post.dart';
import 'package:layered_archtecture_sample/domain/post/post_repository.dart';
import 'package:layered_archtecture_sample/domain/user/entity/user.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_post_repository.dart';

void main() {
  var container = ProviderContainer(
    overrides: [
      postRepositoryProvider.overrideWithValue(MockPostRepository()),
    ],
  );
  group('投稿取得に関するテスト', () {
    test('存在するIDを渡すと特定の投稿が返却される', () async {
      final post = await container.read(postRepositoryProvider).fetch(postId: '001');
      expect(post, isA<Post>());
    });
    test('存在しないIDを渡すとnullが返却される', () async {
      final post = await container.read(postRepositoryProvider).fetch(postId: '009');
      // ignore: prefer_void_to_null
      expect(post, isA<Null>());
    });
  });

  group('投稿全件取得に関するテスト', () {
    test('投稿全件が返却される', () async {
      final posts = await container.read(postRepositoryProvider).fetchAll();
      expect(posts.length, 8);
    });
  });

  group('投稿追加に関するテスト', () {
    test('投稿追加するとリポジトリの投稿が追加される', () async {
      final post = Post(
        id: '010',
        user: const User(
          id: '',
          userName: '',
          imageUrl: '',
        ),
        imageUrl: '',
        comment: '',
        createdAt: DateTime.now(),
      );
      await container.read(postRepositoryProvider).add(post: post);
      final posts = await container.read(postRepositoryProvider).fetchAll();
      expect(posts.length, 9);

      // 追加したpostを削除する
      await container.read(postRepositoryProvider).delete(postId: '010');
    });
  });

  group('投稿削除に関するテスト', () {
    test('投稿削除するとリポジトリの投稿数が減少する', () async {
      await container.read(postRepositoryProvider).delete(postId: '001');
      final posts = await container.read(postRepositoryProvider).fetchAll();
      expect(posts.length, 7);
    });
  });

  group('投稿更新に関するテスト', () {
    test('存在する投稿を渡すと内容が更新される', () async {
      final post = Post(
        id: '008',
        user: const User(
          id: '',
          userName: '',
          imageUrl: '',
        ),
        imageUrl: '',
        comment: 'test',
        createdAt: DateTime.now(),
      );
      await container.read(postRepositoryProvider).update(post: post);
      final updatedPost = await container.read(postRepositoryProvider).fetch(postId: '008');
      expect(updatedPost!.comment, 'test');
    });
  });
}
