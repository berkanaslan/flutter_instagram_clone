import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_instagram_clone/services/storage/storage_base.dart';

class FirebaseStorageService implements StorageBase {
  final firebase_storage.FirebaseStorage _firebaseStorage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<String> updateProfilePhoto(
      String userID, String fileName, File file) async {
    await _firebaseStorage
        .ref()
        .child("user_images")
        .child(userID)
        .child("profile_photo")
        .child(fileName)
        .putFile(file);

    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child("user_images")
        .child(userID)
        .child("profile_photo")
        .child(fileName)
        .getDownloadURL();

    if (downloadURL != null) {
      return downloadURL;
    } else {
      "URL not found!";
    }
  }
}
