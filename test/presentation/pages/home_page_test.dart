import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layered_archtecture_sample/enum/index_mode.dart';
import 'package:layered_archtecture_sample/presentation/page/home_page.dart';

void main() {
  group('レイアウトに関するテスト', () {
    testWidgets('投稿・プロフィールの名称でBNBが表示されていること', (widgetTester) async {
      await widgetTester.pumpWidget(
        const ProviderScope(
          child: _HomePageTest(),
        ),
      );
      // AppbarとBNBに表示
      expect(find.text(IndexMode.list.label), findsNWidgets(2));
      // BNBのみ
      expect(find.text(IndexMode.profile.label), findsNWidgets(1));
    });
  });
  group('状態による表示変更に関するテスト', () {
    testWidgets('初期表示は投稿ページが選択され表示される', (widgetTester) async {});
    testWidgets('プロフィールのBNBをタップするとプロフィールページが表示される', (widgetTester) async {});
  });
  // test('test name', () {});
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
