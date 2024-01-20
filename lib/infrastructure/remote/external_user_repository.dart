// Project imports:
import 'package:layered_archtecture_sample/domain/user/entity/user.dart';
import 'package:layered_archtecture_sample/domain/user/user_repository.dart';

class ExternalUserRepository implements UserRepository {
  @override
  Future<void> delete({required String uid}) {
    throw UnimplementedError();
  }

  @override
  Future<User> fetch({required String uid}) {
    throw UnimplementedError();
  }

  @override
  Future<User> register({required User user}) {
    throw UnimplementedError();
  }

  @override
  Future<User> signIn({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<String> signUp({required String email, required String password}) {
    throw UnimplementedError();
  }
}
