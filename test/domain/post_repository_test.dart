import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layered_archtecture_sample/domain/post/entity/post.dart';
import 'package:layered_archtecture_sample/domain/post/post_repository.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_post_repository.dart';

void main() {
  final mock = MockPostRepository();
  final container = ProviderContainer(
    overrides: [
      // Mockのリポジトリ結果を返却するように設定
      postRepositoryProvider.overrideWithValue(mock),
    ],
  );
  group('投稿取得に関するテスト', () {
    test('存在するIDを渡すと特定の投稿が返却される', () async {
      final post = await container.read(postRepositoryProvider).fetch(postId: '001');
      expect(post, isA<Post>());
    });
    test('存在しないIDを渡すとnullが返却される', () async {
      final post = await container.read(postRepositoryProvider).fetch(postId: '009');
      expect(post, isA<Null>());
    });
  });

  group('投稿全件取得に関するテスト', () {
    test('投稿', () async {
      final post = await container.read(postRepositoryProvider).fetch(postId: '009');
      expect(post, isA<Null>());
    });
  });

  group('投稿追加に関するテスト', () {
    test('', () => null);
  });

  group('投稿削除に関するテスト', () {
    test('', () => null);
  });

  group('投稿更新に関するテスト', () {
    test('', () => null);
  });
}
