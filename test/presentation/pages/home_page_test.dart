import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layered_archtecture_sample/enum/index_mode.dart';
import 'package:layered_archtecture_sample/presentation/page/home_page.dart';

void main() {
  group('レイアウトに関するテスト', () {
    testWidgets('投稿・プロフィールアイコンがBNBで表示されていること', (widgetTester) async {
      await widgetTester.pumpWidget(
        const ProviderScope(
          child: _HomePageTest(),
        ),
      );
      expect(find.byIcon(Icons.list), findsOneWidget);
      expect(find.byIcon(Icons.account_circle), findsOneWidget);
    });
  });
  group('状態による表示変更に関するテスト', () {
    testWidgets('初期表示は投稿ページが選択され表示される', (widgetTester) async {
      await widgetTester.pumpWidget(
        const ProviderScope(
          child: _HomePageTest(),
        ),
      );

      expect(find.widgetWithText(AppBar, IndexMode.list.label), findsNWidgets(1));
      expect(find.widgetWithText(AppBar, IndexMode.profile.label), findsNothing);
    });
    testWidgets('プロフィールのBNBをタップするとプロフィールページが表示される', (widgetTester) async {});
  });
}

class _HomePageTest extends StatelessWidget {
  const _HomePageTest();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
