import 'package:flutter_instagram_clone/locator.dart';
import 'package:flutter_instagram_clone/models/person.dart';
import 'package:flutter_instagram_clone/services/auth/auth_base.dart';
import 'package:flutter_instagram_clone/services/auth/firebase_auth_service.dart';
import 'package:flutter_instagram_clone/services/db/db_base.dart';
import 'package:flutter_instagram_clone/services/db/firestore_db_service.dart';

enum ServiceMode { FIREBASE, OTHERS }

class PersonRepository implements AuthBase, Exception {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();

  ServiceMode serviceMode = ServiceMode.FIREBASE;

  @override
  Future<Person> currentPerson() async {
    if (serviceMode == ServiceMode.OTHERS) {
      return null;
    } else {
      Person _person = await _firebaseAuthService.currentPerson();
      if (_person != null)
        return await _firestoreDBService.readUser(_person.userID);
      else
        return null;
    }
  }

  @override
  Future<Person> createWithMailAndPass(
      String mail, String pass, String userName) async {
    if (serviceMode == ServiceMode.OTHERS) {
      return null;
    } else {
      bool checkUserName = await _firestoreDBService.checkUserName(userName);
      if (checkUserName) {
        throw "Bu Kullanıcı adı kullanılıyor.";
      } else {
        Person _person = await _firebaseAuthService.createWithMailAndPass(
            mail, pass, userName);
        bool _result = await _firestoreDBService.saveUser(_person, userName);
        if (_result) {
          return await _firestoreDBService.readUser(_person.userID);
        } else {
          return null;
        }
      }
    }
  }

  @override
  Future<Person> signInWithMailAndPass(String mail, String pass) async {
    if (serviceMode == ServiceMode.OTHERS) {
      return null;
    } else {
      Person _person =
          await _firebaseAuthService.signInWithMailAndPass(mail, pass);

      return await _firestoreDBService.readUser(_person.userID);
    }
  }

  @override
  Future<bool> signOut() async {
    if (serviceMode == ServiceMode.OTHERS) {
      return null;
    } else {
      return await _firebaseAuthService.signOut();
    }
  }

  Future<bool> updateProfileDetails(
      String userID, String name, String userName, String bio) async {
    if (serviceMode == ServiceMode.OTHERS) {
      return null;
    } else {
      return await _firestoreDBService.updateProfileDetails(
          userID, name, userName, bio);
    }
  }

  Future<bool> updateProfileDetailsWithoutUserName(
      String userID, String name, String bio) async {
    if (serviceMode == ServiceMode.OTHERS) {
      return null;
    } else {
      return await _firestoreDBService.updateProfileDetailsWithoutUserName(
          userID, name, bio);
    }
  }

  Future<bool> updateProfilePhoto(String userID, String profilePhotoUrl) async {
    if (serviceMode == ServiceMode.OTHERS) {
      return null;
    } else {
      return await _firestoreDBService.updateProfilePhoto(
          userID, profilePhotoUrl);
    }
  }
}
