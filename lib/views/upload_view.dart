import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/locator.dart';
import 'package:flutter_instagram_clone/repositories/upload_repository.dart';
import 'package:flutter_instagram_clone/services/storage/storage_base.dart';

enum ViewState { IDLE, BUSY }

class UploadView with ChangeNotifier implements StorageBase {
  ViewState _state = ViewState.IDLE;
  UploadRepository _uploadRepository = locator<UploadRepository>();

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Future<String> updateProfilePhoto(String userID, String fileName, File file) async {
    try {
      state = ViewState.BUSY;
      return await _uploadRepository.updateProfilePhoto(userID, fileName, file);
    } catch (e) {
      print("UploadView updateProfilePhoto() hatası: " + e.toString());
      return null;
    } finally {
      state = ViewState.IDLE;
    }
  }
}
