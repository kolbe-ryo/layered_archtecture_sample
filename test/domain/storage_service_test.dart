import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layered_archtecture_sample/domain/service/storage_service.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_storage_service.dart';

void main() {
  final mock = MockStorageService();
  final container = ProviderContainer(
    overrides: [
      // Mockのリポジトリ結果を返却するように設定
      storageServiceProvider.overrideWithValue(mock),
    ],
  );
  test('画像ファイルを渡すと画像URLが返却される', () async {
    final image = File('');
    final imageUrl = await container.read(storageServiceProvider).uploadImage(image: image);
    expect(imageUrl,
        'https://1.bp.blogspot.com/-rb5mSYSN8pA/X6tmegQM2ZI/AAAAAAABcLw/_-n5UvfxhJItVJnKRrycKPShVDsxStrjACNcBGAsYHQ/s400/fruit_apple_yellow.png');
  });

  test('nullを渡すと空文字がレスポンスされる', () async {
    final imageUrl = await container.read(storageServiceProvider).uploadImage(image: null);
    expect(imageUrl, '');
  });
}
