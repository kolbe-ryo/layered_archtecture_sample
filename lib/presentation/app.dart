import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/presentation/component/overlay_loading.dart';
import 'package:layered_archtecture_sample/presentation/page/signin_page.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: const SignInPage(),
      builder: ((context, navigator) {
        return Stack(
          children: [
            navigator!,
            const OverlayLoading(),
          ],
        );
      }),
    );
  }
}
