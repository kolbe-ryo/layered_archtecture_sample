import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layered_archtecture_sample/application/usecase/user/state/user_provider.dart';
import 'package:layered_archtecture_sample/domain/service/storage_service.dart';
import 'package:layered_archtecture_sample/domain/user/entity/user.dart';
import 'package:layered_archtecture_sample/domain/user/user_repository.dart';
import 'package:layered_archtecture_sample/util/logger.dart';

final userUsecaseProvider = Provider<UserUsecaseInterface>(UserUsecase.new);

// MockのUsecaseを差し込みたい場合、Providerの差し込み内容を変更する
abstract class UserUsecaseInterface {
  Future<void> signUp({
    required String email,
    required String password,
  });

  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> register({
    required String? uid,
    required String userName,
    required File? image,
  });
}

class MockUserUsecase implements UserUsecaseInterface {
  @override
  Future<void> register({
    required String? uid,
    required String userName,
    required File? image,
  }) async {
    logger.i('register usecase');
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    logger.i('sign in usecase');
  }

  @override
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    logger.i('sign up usecase');
  }
}

class UserUsecase implements UserUsecaseInterface {
  const UserUsecase(this._ref);

  final Ref _ref;

  @override
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    final userId = await _ref.read(userRepositoryProvider).signUp(
          email: email,
          password: password,
        );
    _ref.read(uidProvider.notifier).update((_) => userId);
  }

  @override
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

  @override
  Future<void> register({
    required String? uid,
    required String userName,
    required File? image,
  }) async {
    if (uid == null) {
      return;
    }

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
