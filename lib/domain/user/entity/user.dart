import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
// @AssertはAssertionErrorでcatchできる？
  @Assert('id.isNotEmpty', 'ID cannot be empty')
  @Assert('userName.isNotEmpty', 'UserName cannot be empty')
  @Assert('imageUrl.isNotEmpty', 'ImageURL cannot be empty')
  const factory User({
    required String id,
    required String userName,
    required String imageUrl,
  }) = _User;
}
