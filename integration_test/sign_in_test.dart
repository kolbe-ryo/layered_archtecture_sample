import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:layered_archtecture_sample/domain/post/post_repository.dart';
import 'package:layered_archtecture_sample/domain/service/storage_service.dart';
import 'package:layered_archtecture_sample/domain/user/user_repository.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_post_repository.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_storage_service.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_user_repository.dart';
import 'package:layered_archtecture_sample/presentation/app.dart';

void main() {
  testWidgets('ログイン画面からサインインに成功し、プロフィールページに遷移', (widgetTester) async {
    // Appの構築
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          userRepositoryProvider.overrideWithValue(MockUserRepository()),
          postRepositoryProvider.overrideWithValue(MockPostRepository()),
          storageServiceProvider.overrideWithValue(MockStorageService()),
        ],
        child: const App(),
      ),
    );

    //
  });

  testWidgets('ログイン画面からサインインに成功し、プロフィールページに遷移', (widgetTester) async {});
}
