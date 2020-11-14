import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/locator.dart';
import 'package:flutter_instagram_clone/models/person.dart';
import 'package:flutter_instagram_clone/repositories/auth_repository.dart';
import 'package:flutter_instagram_clone/services/auth/auth_base.dart';

enum ViewState { IDLE, BUSY }

class UserAuthView with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.IDLE;
  Person _person;
  AuthRepository _authRepository = locator<AuthRepository>();

  ViewState get state => _state;

  Person get person => _person;

  String mailErrorMessage;
  String passErrorMessage;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserAuthView() {
    currentPerson();
  }

  @override
  Future<Person> currentPerson() async {
    try {
      state = ViewState.BUSY;
      _person = await _authRepository.currentPerson();
      if (_person != null) {
        return _person;
      } else {
        return null;
      }
    } catch (e) {
      print("ViewModel currentPerson() hatası: " + e.toString());
      return null;
    } finally {
      state = ViewState.IDLE;
    }
  }

  @override
  Future<Person> createWithMailAndPass(
      String mail, String pass, String userName) async {
    if (_mailAndPassControl(mail, pass)) {
      try {
        state = ViewState.BUSY;
        _person =
            await _authRepository.createWithMailAndPass(mail, pass, userName);
        return _person;
      } finally {
        state = ViewState.IDLE;
      }
    } else {
      return null;
    }
  }

  @override
  Future<Person> signInWithMailAndPass(String mail, String pass) async {
    if (_mailAndPassControl(mail, pass)) {
      try {
        state = ViewState.BUSY;
        _person = await _authRepository.signInWithMailAndPass(mail, pass);
        return _person;
      } finally {
        state = ViewState.IDLE;
      }
    } else {
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.BUSY;
      bool result = await _authRepository.signOut();
      _person = null;
      return result;
    } catch (e) {
      print("ViewModel signOut() hatası: " + e.toString());
      return false;
    } finally {
      state = ViewState.IDLE;
    }
  }

  bool _mailAndPassControl(String mail, String pass) {
    var result = true;

    if (pass.length < 6) {
      passErrorMessage = "Şifreniz en az 6 karakterden oluşmalıdır.";
      result = false;
    } else {
      passErrorMessage = null;
    }
    if (!mail.contains('@')) {
      mailErrorMessage = "Lütfen geçerli bir e-posta adresi giriniz.";
      result = false;
    } else {
      mailErrorMessage = null;
    }

    return result;
  }
}
