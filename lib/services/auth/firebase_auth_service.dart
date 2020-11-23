import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_instagram_clone/models/person.dart';
import 'package:flutter_instagram_clone/services/auth/auth_base.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Person> currentPerson() async {
    try {
      User user = await Future.value(_firebaseAuth.currentUser);
      return _userFromFirebase(user);
    } catch (e) {
      print("FirebaseAuthService currentUser() hatası: " + e.toString());
      return null;
    }
  }

  Person _userFromFirebase(User user) {
    if (user == null) {
      return null;
    } else {
      return Person(userID: user.uid, mail: user.email);
    }
  }

  @override
  Future<Person> createWithMailAndPass(
      String mail, String pass, String userName) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: mail, password: pass);
    return _userFromFirebase(userCredential.user);
  }

  @override
  Future<Person> signInWithMailAndPass(String mail, String pass) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: mail, password: pass);
    return _userFromFirebase(userCredential.user);
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print("FirebaseAuthService signOut() hatası: " + e.toString());
      return false;
    }
  }
}
