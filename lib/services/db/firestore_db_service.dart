import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_instagram_clone/models/person.dart';
import 'package:flutter_instagram_clone/services/db/db_base.dart';

class FirestoreDBService implements DBBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Person> readUser(String userID) async {
    DocumentSnapshot _readingValues =
        await _firestore.collection('users').doc(userID).get();

    Map<String, dynamic> _readingValuesMap = _readingValues.data();
    Person _userModelObject = Person.fromMap(_readingValuesMap);
    print("Okunan Person nesnesi: " + _userModelObject.toString());
    return _userModelObject;
  }

  Future<bool> checkUserName(String userName) async {
    var otherUserNames = await _firestore
        .collection('users')
        .where('userName', isEqualTo: userName)
        .get();

    return otherUserNames.docs.isNotEmpty;
  }

  @override
  Future<bool> saveUser(Person person, String userName) async {
    person.userName = userName;
    await _firestore.collection("users").doc(person.userID).set(person.toMap());
    return true;
  }

  @override
  Future<bool> updateProfileDetails(
      String userID, String name, String userName, String bio) async {
    bool check = await checkUserName(userName);
    if (check) {
      return false;
    } else {
      await _firestore
          .collection('users')
          .doc(userID)
          .update({'userName': userName, 'name': name, 'bio': bio});
      return true;
    }
  }

  @override
  Future<bool> updateProfileDetailsWithoutUserName(
      String userID, String name, String bio) async {
    await _firestore
        .collection('users')
        .doc(userID)
        .update({'name': name, 'bio': bio});
    return true;
  }

  @override
  Future<bool> updateProfilePhoto(String userID, String profilePhotoUrl) async {
    await _firestore
        .collection('users')
        .doc(userID)
        .update({'profilePhotoUrl': profilePhotoUrl});
    return true;
  }
}
