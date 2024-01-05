import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/application/usecase/user/state/user_provider.dart';
import 'package:layered_archtecture_sample/domain/service/storage_service.dart';
import 'package:layered_archtecture_sample/domain/user/entity/user.dart';
import 'package:layered_archtecture_sample/domain/user/user_repository.dart';

final userUsecaseInterfaceProvider = Provider<UserUsecaseInterface>((ref) => null);

final userUsecaseProvider = Provider<UserUsecase>(UserUsecase.new);

abstract class UserUsecaseInterface {
  Future<void> signup();
}

class UserUsecase {
  const UserUsecase(this._ref);

  final Ref _ref;

  final 

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    // TODO: アプリケーションサービスをIF経由で呼び出すよう検討してみる（ドメイン駆動設計p149参照）
    final userId = await _ref.read(userRepositoryProvider).signUp(
          email: email,
          password: password,
        );
    _ref.read(uidProvider.notifier).update((_) => userId);
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final user = await _ref.read(userRepositoryProvider).signIn(
          email: email,
          password: password,
        );
    _ref.read(uidProvider.notifier).update((_) => user.id);
    _ref.read(userProvider.notifier).setUser = user;
  }

  Future<void> register({
    required String? uid,
    required String userName,
    required File? image,
  }) async {
    if (uid == null) return;

    final imageUrl = await _ref.read(storageServiceProvider).uploadImage(image: image);
    final user = User(
      id: uid,
      userName: userName,
      imageUrl: imageUrl,
    );
    final updatedUser = await _ref.read(userRepositoryProvider).register(user: user);
    _ref.read(userProvider.notifier).setUser = updatedUser;
  }
}
