import 'package:flutter_instagram_clone/models/person.dart';

abstract class AuthBase {
  Future<Person> currentPerson();

  Future<bool> signOut();

  Future<Person> signInWithMailAndPass(String mail, String pass);

  Future<Person> createWithMailAndPass(String mail, String pass, String userName);
}
