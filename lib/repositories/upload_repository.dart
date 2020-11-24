import 'dart:io';

import 'package:flutter_instagram_clone/services/storage/firebase_storage_service.dart';
import 'package:flutter_instagram_clone/services/storage/storage_base.dart';

import '../locator.dart';

enum ServiceMode { FIREBASE, OTHERS }

class UploadRepository implements StorageBase {
  ServiceMode serviceMode = ServiceMode.FIREBASE;
  FirebaseStorageService _firebaseStorageService =
      locator<FirebaseStorageService>();

  @override
  Future<String> updateProfilePhoto(
      String userID, String fileName, File file) async {
    if (serviceMode == ServiceMode.OTHERS) {
      return null;
    } else {
      return await _firebaseStorageService.updateProfilePhoto(
          userID, fileName, file);
    }
  }
}
