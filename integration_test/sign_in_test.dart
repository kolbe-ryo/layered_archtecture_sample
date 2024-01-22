import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layered_archtecture_sample/domain/post/post_repository.dart';
import 'package:layered_archtecture_sample/domain/service/storage_service.dart';
import 'package:layered_archtecture_sample/domain/user/user_repository.dart';
import 'package:layered_archtecture_sample/presentation/enum/index_mode.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_post_repository.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_storage_service.dart';
import 'package:layered_archtecture_sample/infrastructure/mocks/mock_user_repository.dart';
import 'package:layered_archtecture_sample/presentation/app.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/email_text_field.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/password_text_field.dart';
import 'package:layered_archtecture_sample/presentation/page/user/components/signin_button.dart';

// 実行はflutter run -t integration_test/**_test.dartのコマンドを使用するとShift + rでホットリロードなど可能なため便利
// https://qiita.com/allJokin/items/8576ef79710d7e682c2c
void main() {
  const email = 'test@example.com';
  const password = 'test';

  testWidgets('ログイン画面でサインインに成功し、HomePageに遷移', (widgetTester) async {
    // Appの構築
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          userRepositoryProvider.overrideWithValue(MockUserRepository()),
          postRepositoryProvider.overrideWithValue(MockPostRepository()),
          storageServiceProvider.overrideWithValue(MockStorageService()),
        ],
        child: const App(),
      ),
    );

    // ログイン画面が表示され、テキストに何も入力されていないこと
    expect(find.text('サインイン'), findsOneWidget);
    expect(find.text(email), findsNothing);
    expect(find.text(password), findsNothing);

    // Email/Passwordを入力する
    await widgetTester.enterText(find.byType(EmailTextField), email);
    await widgetTester.enterText(find.byType(PasswordTextField), password);
    await widgetTester.pump();

    // Email/Password Validation
    expect(find.text(email), findsOneWidget);
    expect(find.text(password), findsOneWidget);

    // SignInする
    await widgetTester.tap(find.byType(SignInButton));
    await widgetTester.pump(const Duration(seconds: 2));
    await widgetTester.pumpAndSettle();

    // HomePageが表示されること（Appbarに「投稿リスト」が表示されていればログイン成功）
    expect(find.widgetWithText(AppBar, IndexMode.list.label), findsOneWidget);
  });

  testWidgets('ログイン画面でサインインに失敗し、ログイン画面でスナックバーガ表示される', (widgetTester) async {
    // Appの構築
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          userRepositoryProvider.overrideWithValue(MockUserRepository()),
          postRepositoryProvider.overrideWithValue(MockPostRepository()),
          storageServiceProvider.overrideWithValue(MockStorageService()),
        ],
        child: const App(),
      ),
    );

    // ログイン画面が表示され、テキストに何も入力されていないこと
    expect(find.text('サインイン'), findsOneWidget);
    expect(find.text(email), findsNothing);
    expect(find.text(password), findsNothing);

    // Email/Passwordを入力する（誤ったpassword）
    await widgetTester.enterText(find.byType(EmailTextField), email);
    await widgetTester.enterText(find.byType(PasswordTextField), 'password');
    await widgetTester.pump();

    // SignInする
    await widgetTester.tap(find.byType(SignInButton));
    await widgetTester.pump(const Duration(seconds: 2));
    await widgetTester.pumpAndSettle();

    // SnackBarでエラーメッセージが表示されること
    expect(find.text('メールアドレス または パスワードが異なります'), findsOneWidget);
  });
}
