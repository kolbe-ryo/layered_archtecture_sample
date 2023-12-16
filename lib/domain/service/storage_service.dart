import 'dart:io';

abstract class StorageService {
  /// 指定した画像をストレージにアップロード
  Future<String> uploadImage({required File image});
}
