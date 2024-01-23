import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:layered_archtecture_sample/domain/post/post_repository.dart';
import 'package:layered_archtecture_sample/domain/service/storage_service.dart';
import 'package:layered_archtecture_sample/domain/user/user_repository.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_post_repository.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_storage_service.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_user_repository.dart';
import 'package:layered_archtecture_sample/presentation/app.dart';

void main() {
  testGoldens('ログイン画面のゴールデンテスト', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone, Device.iphone11])
      ..addScenario(
        widget: ProviderScope(
          overrides: [
            userRepositoryProvider.overrideWithValue(MockUserRepository()),
            postRepositoryProvider.overrideWithValue(MockPostRepository()),
            storageServiceProvider.overrideWithValue(MockStorageService()),
          ],
          child: const App(),
        ),
        name: 'SignIn',
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'SignIn');

    // add this:
    await tester.pumpWidget(Container());
    await tester.pumpAndSettle();
  });
}
