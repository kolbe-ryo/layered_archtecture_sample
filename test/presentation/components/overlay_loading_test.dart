// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:layered_archtecture_sample/application/state/overlay_loading_provider.dart';
import 'package:layered_archtecture_sample/presentation/components/overlay_loading.dart';

void main() {
  group('OverlayLoadingに関するテスト', () {
    testWidgets('ローディング中ではない場合、Indicatorが表示されないこと', (widgetTester) async {
      final testWidget = ProviderScope(
        overrides: [
          overlayLoadingProvider.overrideWith((ref) => false),
        ],
        child: const _OverlayLoadingOutline(),
      );
      await widgetTester.pumpWidget(testWidget);

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('ローディング中の場合、Indicatorが表示されること', (widgetTester) async {
      final testWidget = ProviderScope(
        overrides: [
          overlayLoadingProvider.overrideWith((ref) => true),
        ],
        child: const _OverlayLoadingOutline(),
      );
      await widgetTester.pumpWidget(testWidget);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}

class _OverlayLoadingOutline extends StatelessWidget {
  const _OverlayLoadingOutline();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: OverlayLoading(),
      ),
    );
  }
}
