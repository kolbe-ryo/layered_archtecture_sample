import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/presentation/app.dart';

void main() {
  runApp(
    const ProviderScope(
      overrides: [
        // implement providers
      ],
      child: App(),
    ),
  );
}
