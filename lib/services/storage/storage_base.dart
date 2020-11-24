import 'dart:io';

abstract class StorageBase {
  Future<String> updateProfilePhoto(String userID, String fileName, File file);
}
