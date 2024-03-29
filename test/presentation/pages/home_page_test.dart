// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:layered_archtecture_sample/presentation/enum/index_mode.dart';
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

      expect(find.widgetWithText(AppBar, IndexMode.list.label), findsOneWidget);
      expect(find.widgetWithText(AppBar, IndexMode.profile.label), findsNothing);
    });
    testWidgets('プロフィールのBNBをタップするとプロフィールページが表示される', (widgetTester) async {
      await widgetTester.pumpWidget(
        const ProviderScope(
          child: _HomePageTest(),
        ),
      );

      // デフォルト表示のチェック
      expect(find.widgetWithText(AppBar, IndexMode.list.label), findsOneWidget);
      expect(find.widgetWithText(AppBar, IndexMode.profile.label), findsNothing);

      // BNBのプロフィールをタップする
      await widgetTester.tap(find.byIcon(Icons.account_circle));
      await widgetTester.pump();

      // タップ後のWidgetチェック
      expect(find.widgetWithText(AppBar, IndexMode.list.label), findsNothing);
      expect(find.widgetWithText(AppBar, IndexMode.profile.label), findsOneWidget);
    });
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
