// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:layered_archtecture_sample/application/usecase/post/post_usecase.dart';
import 'package:layered_archtecture_sample/domain/post/entity/post.dart';

final postProvider = FutureProvider.autoDispose<List<Post>>(
  (ref) async => ref.watch(postUsecaseProvider).fetchAll(),
);
