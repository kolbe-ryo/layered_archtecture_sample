import 'package:layered_archtecture_sample/application/usecase/post/post_usecase.dart';
import 'package:layered_archtecture_sample/domain/post/entity/post.dart';
import 'package:riverpod/riverpod.dart';

final postProvider = FutureProvider.autoDispose<List<Post>>(
  (ref) async => ref.watch(postUsecaseProvider).fetchAll(),
);
