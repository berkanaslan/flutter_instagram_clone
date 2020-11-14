import 'package:flutter_instagram_clone/models/person.dart';

abstract class DBBase {
  Future<bool> saveUser(Person person, String userName);

  Future<Person> readUser(String userID);
}
