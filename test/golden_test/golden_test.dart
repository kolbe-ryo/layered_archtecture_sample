import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:layered_archtecture_sample/presentation/app.dart';

void main() {
  testGoldens('ログイン画面のゴールデンテスト', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone, Device.iphone11])
      ..addScenario(widget: const App(), name: 'Sign In Page');
  });
}
