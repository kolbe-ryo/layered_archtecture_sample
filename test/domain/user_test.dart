import 'package:flutter_test/flutter_test.dart';
import 'package:layered_archtecture_sample/domain/user/entity/user.dart';
import 'package:layered_archtecture_sample/util/logger.dart';

void main() {
  test('User ID is Empty', () {
    try {
      const User(id: '', userName: 'userName', imageUrl: 'imageUrl');
    } on AssertionError catch (e) {
      final message = e.message;
      expect(message, 'User ID is Empt');
    }
  });

  test('User ID is NotEmpty', () {
    const user = User(id: 'id', userName: 'userName', imageUrl: 'imageUrl');
    expect(user.id, 'id');
  });
}
