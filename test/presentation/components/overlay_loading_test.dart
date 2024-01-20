// TODO

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layered_archtecture_sample/application/state/overlay_loading_provider.dart';
import 'package:layered_archtecture_sample/presentation/components/overlay_loading.dart';

void main() {
  group('OverlayLoadingに関するテスト', () {
    test('ローディング中ではない場合、Indicatorが表示されないこと', () {
      final providerContainer = ProviderContainer(
        overrides: [
          overlayLoadingProvider.overrideWith((ref) => false),
        ],
      );
    });
    test('ローディング中の場合、Indicatorが表示されること', () {
      final providerContainer = ProviderContainer(
        overrides: [
          overlayLoadingProvider.overrideWith((ref) => true),
        ],
      );
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
