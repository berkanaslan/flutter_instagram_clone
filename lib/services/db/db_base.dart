import 'package:flutter_instagram_clone/models/person.dart';

abstract class DBBase {
  Future<bool> saveUser(Person person, String userName);

  Future<Person> readUser(String userID);

  Future<bool> updateProfileDetails(
      String userID, String name, String userName, String bio);

  Future<bool> updateProfileDetailsWithoutUserName(
      String userID, String name, String bio);

  Future<bool> updateProfilePhoto(String userID, String profilePhotoUrl);
}
