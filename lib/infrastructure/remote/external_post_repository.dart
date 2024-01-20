// Project imports:
import 'package:layered_archtecture_sample/domain/post/entity/post.dart';
import 'package:layered_archtecture_sample/domain/post/post_repository.dart';

class ExternalPostRepository implements PostRepository {
  @override
  Future<void> add({required Post post}) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required String postId}) {
    throw UnimplementedError();
  }

  @override
  Future<Post> fetch({required String postId}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> fetchAll() {
    throw UnimplementedError();
  }

  @override
  Future<void> update({required Post post}) {
    throw UnimplementedError();
  }
}
