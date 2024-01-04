import 'dart:io';

import 'package:layered_archtecture_sample/domain/service/storage_service.dart';

class ExternalStorageService implements StorageService {
  @override
  Future<String> uploadImage({required File? image}) {
    throw UnimplementedError();
  }
}
