// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:layered_archtecture_sample/presentation/components/overlay_loading.dart';
import 'package:layered_archtecture_sample/presentation/page/theme.dart';
import 'package:layered_archtecture_sample/presentation/page/user/signin_page.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'SNS',
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeProvider),
      home: const SignInPage(),
      // builderを使用するとNavigatorの上に、Widgetを配置することができる
      // 従って、今回だとisLoading（OverlayLoadingの内部実装）がtrueの時には、ローディング画面がどこの画面にいても
      // Stackの最上部に配置される。このように画面全体に特定のWidgetを適用させたり、Providerを配置することで画面全体どこからでも
      // contextを用いてアクセル可能な状態を作ることができる（一般的には多言語化やMediaQueryなどで使用されることが多い）
      builder: (_, navigator) {
        return Stack(
          children: [
            navigator!,
            const OverlayLoading(),
          ],
        );
      },
    );
  }
}
