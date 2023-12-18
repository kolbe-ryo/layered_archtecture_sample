import 'package:riverpod/riverpod.dart';

class UserUsecase {
  const UserUsecase(this._ref);

  final Ref _ref;

  Future<void> signUp({
    required String email,
    required String password,
  }) async {}
}
