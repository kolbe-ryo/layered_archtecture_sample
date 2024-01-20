// Dart imports:
import 'dart:io';

// Project imports:
import 'package:layered_archtecture_sample/domain/service/storage_service.dart';

class ExternalStorageService implements StorageService {
  @override
  Future<String> uploadImage({required File? image}) {
    throw UnimplementedError();
  }
}
