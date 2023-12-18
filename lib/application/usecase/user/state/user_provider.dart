import 'package:layered_archtecture_sample/domain/user/entity/user.dart';
import 'package:riverpod/riverpod.dart';

class CurrentUser extends Notifier<User?> {
  @override
  User? build() => null;

  set setUser(User? user) => state = user?.copyWith();
}
