// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:layered_archtecture_sample/application/state/overlay_loading_provider.dart';

class OverlayLoading extends ConsumerWidget {
  const OverlayLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(overlayLoadingProvider);
    return Visibility(
      visible: isLoading,
      child: const ColoredBox(
        color: Colors.black26,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
